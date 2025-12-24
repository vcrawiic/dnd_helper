import 'dart:io';
import 'package:dnd_helper/DS/pallete.dart';
import 'package:dnd_helper/pages/profile/image_picker/image_cubit.dart';
import 'package:dnd_helper/pages/profile/image_picker/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImagePickerState>(
      listener: (context, state) {
        if (state is ImagePermissionDenied) {
          _showPermissionDialog(context, state.message);
        }
      },
      builder: (context, state) {
        final String? imagePath = state is ImageLoaded ? state.imagePath : null;

        ImageProvider<Object> provider;
        if (imagePath != null) {
          provider = FileImage(File(imagePath));
        } else {
          provider = AssetImage('assets/dung.jpg');
        }

        return Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () => _showImageSourceDialog(context),
              child: CircleAvatar(radius: 75, backgroundImage: provider),
            ),
            if (imagePath != null)
              Positioned(
                bottom: 0,
                right: 0,
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: Pallete.primary,
                  onPressed: () {
                    context.read<ImageCubit>().delete();
                  },
                  child: Icon(Icons.delete, color: Pallete.primaryBG, size: 20),
                ),
              ),
          ],
        );
      },
    );
  }

  void _showPermissionDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (dialogContext) => AlertDialog(
        title: Text('No access'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext, rootNavigator: true).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext, rootNavigator: true).pop();
              await Future.delayed(Duration(milliseconds: 100));
              openAppSettings();
            },
            child: Text('Open settings'),
          ),
        ],
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Pallete.primaryBGAlpha200,
      context: context,
      builder: (bottomSheetContext) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                tileColor: Colors.transparent,
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(bottomSheetContext);
                  context.read<ImageCubit>().selectFrom(ImageSource.gallery);
                },
              ),
              ListTile(tileColor: Colors.transparent,
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(bottomSheetContext);
                  context.read<ImageCubit>().selectFrom(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

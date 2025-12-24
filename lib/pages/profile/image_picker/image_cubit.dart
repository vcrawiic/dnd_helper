import 'package:dnd_helper/pages/profile/image_picker/image_state.dart';
import 'package:dnd_helper/services/storage_service/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageCubit extends Cubit<ImagePickerState> {
  final ImagePicker _imagePicker = ImagePicker();
  final StorageService _storageService;

  ImageCubit(this._storageService) : super(ImageInitial());

  Future<void> loadSavedImage() async {
    final savedPath = await _storageService.read();
    if (savedPath != null) {
      emit(ImageLoaded(savedPath));
    }
  }

  Future<void> selectFrom(ImageSource source) async {
    if (source == ImageSource.camera) {
      final hasPermission = await _checkCameraPermission();
      if (!hasPermission) return;
    }
    emit(ImageLoading());
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        requestFullMetadata: false,
      );
      if (image != null) {
        final permanentPath = await _storageService.write(image.path);
        emit(ImageLoaded(permanentPath));
      } else {
        final savedPath = await _storageService.read();
        emit(ImageLoaded(savedPath));
      }
    } catch (e) {
      emit(ImageError(message: 'Unable to select image'));
    }
  }

  Future<void> delete() async {
    await _storageService.delete();
    emit(ImageLoaded(null));
  }

  Future<bool> _checkCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;

    if (!status.isGranted) {
      status = await Permission.camera.request();
    }

    if (!status.isGranted) {
      emit(
        ImagePermissionDenied(
          message: status.isPermanentlyDenied
              ? 'Camera access denied. Enable it in the app settings.'
              : 'Permission is required to use the camera.',
        ),
      );
      return false;
    }
    return true;
  }
}

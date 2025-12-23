import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final File? image;
  const ProfileImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> provider;
    if (image != null) {
      provider = FileImage(image!);
    } else {
      provider = AssetImage('assets/dung.jpg');
    }
    return CircleAvatar(radius: 75, backgroundImage: provider);
  }
}

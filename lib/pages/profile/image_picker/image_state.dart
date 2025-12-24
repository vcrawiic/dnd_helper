abstract class ImagePickerState {}

class ImageInitial extends ImagePickerState {}

class ImagePermissionDenied extends ImagePickerState {
  final String message;
  ImagePermissionDenied({required this.message});
}

class ImageLoading extends ImagePickerState {}

class ImageLoaded extends ImagePickerState {
  final String? imagePath;
  ImageLoaded(this.imagePath);
}

class ImageError extends ImagePickerState {
  final String message;
  ImageError({required this.message});
}

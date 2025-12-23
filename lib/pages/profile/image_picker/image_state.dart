import 'package:image_picker/image_picker.dart';

abstract class ImagePickerState {}

class ImageInitial extends ImagePickerState {}
class ImageLoading extends ImagePickerState {}
class ImageLoaded extends ImagePickerState {
  final XFile? image;
  ImageLoaded(this.image);
}
class ImageError extends ImagePickerState {
  final String message;
  ImageError({required this.message});
}
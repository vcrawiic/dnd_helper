import 'package:dnd_helper/pages/profile/image_picker/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImagePickerState> {
  final ImagePicker _imagePicker = ImagePicker();

  ImageCubit() : super(ImageInitial());

  Future<void> selectFrom(ImageSource source) async {
    emit(ImageLoading());
    try {
      final XFile? image = await _imagePicker.pickImage(source: source);
      emit(ImageLoaded(image));
    } catch (e) {
      emit(ImageError(message: 'No selected image'));
    }
  }

  void delete() {
    emit(ImageLoaded(null));
  }
}

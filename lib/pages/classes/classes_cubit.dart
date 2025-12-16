import 'package:dnd_helper/pages/classes/classes_state.dart';
import 'package:dnd_helper/models/classes/class_order.dart';
import 'package:dnd_helper/services/gql/graphql_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit(this._service) : super(ClassesInitial());

  final GraphQLService _service;

  Future<void> fetchClasses(ClassOrder order) async {
    if (!isClosed) {
      emit(ClassesLoading());
    }

    try {
      final classes = await _service.fetchClasses(order);
      if (!isClosed) {
        if (classes != null) {
          emit(ClassesLoaded(classes));
        } else {
          emit(ClassesError('no data'));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(ClassesError(e.toString()));
      }
    }
  }
}

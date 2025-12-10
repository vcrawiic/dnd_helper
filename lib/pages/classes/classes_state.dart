import 'package:dnd_helper/models/classes/classes.dart';

abstract class ClassesState {}

class ClassesInitial extends ClassesState {}

class ClassesLoading extends ClassesState {}

class ClassesLoaded extends ClassesState {
  ClassesLoaded(this.classes);
  final Classes classes;
}

class ClassesError extends ClassesState {
  ClassesError(this.message);
  final String message;
}
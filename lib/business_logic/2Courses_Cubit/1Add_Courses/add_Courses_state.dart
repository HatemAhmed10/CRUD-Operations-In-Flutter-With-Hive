part of 'add_Courses_cubit.dart';

@immutable
abstract class AddCoursesState {}

class AddCoursesInitial extends AddCoursesState {}

class AddCoursesLoading extends AddCoursesState {}

class AddCoursesSuccess extends AddCoursesState {}

class AddCoursesFailure extends AddCoursesState {
  final String errMessage;

  AddCoursesFailure(this.errMessage);
}

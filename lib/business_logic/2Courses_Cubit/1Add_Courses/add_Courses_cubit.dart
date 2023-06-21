import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../models/2Course_Model/CourseModel.dart';
import '../../../shared/components/4CustomshowToast.dart';
import '../../../shared/components/constants.dart';

part 'add_Courses_state.dart';

class AddCoursesCubit extends Cubit<AddCoursesState> {
  AddCoursesCubit() : super(AddCoursesInitial());

  List<CourseModel>? Courses2;
  bool ItemFound = false;
  addCourses(CourseModel Courses) async {
    emit(AddCoursesLoading());
    Courses2 = [];

    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    Courses2 = LessonBox.values.toList();

    Courses2!.forEach((element) {
      if (element.CourseID == Courses.CourseID) {
        ItemFound = true;
      }
    });
    if (ItemFound == false) {
      try {
        var CoursesBox = Hive.box<CourseModel>(kCourseBox);
        await CoursesBox.add(Courses);
        showToast(state: ToastStates.SUCCESS, text: "Good Add");
        emit(AddCoursesSuccess());
      } catch (e) {
        emit(AddCoursesFailure(e.toString()));
      }
    } else {
      showToast(state: ToastStates.SUCCESS, text: "This Item is Alreade Add");
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

import '../../../models/2Course_Model/CourseModel.dart';
import '../../../shared/components/4CustomshowToast.dart';
import '../../../shared/components/constants.dart';

part 'Update_Courses_state.dart';

class UpdateCoursesCubit extends Cubit<UpdateCoursesState> {
  UpdateCoursesCubit() : super(UpdateCoursesInitial());

  List<CourseModel>? Courses2;
  CourseModel? OneCourses;
  bool ItemFound = false;
  CourseModel NotFountModel = CourseModel(
      CoursestudentList: [],
      CourseName: "",
      CourseID: "",
      CoursePrice: "",
      officeRate: "",
      teacherRate: "",
      TeacherId: "",
      studentInf: {});

  UpdateCourses(
      {required String CoursesID, required CourseModel Courses}) async {
    Courses2 = [];
    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    Courses2 = LessonBox.values.toList();
    OneCourses = Courses2!.firstWhere(
      (item) => item.CourseID == CoursesID.toString(),
      orElse: () => NotFountModel,
    );
    if (OneCourses!.CourseID == "") {
      showToast(state: ToastStates.SUCCESS, text: "Not Found");
    } else {
      await LessonBox.put(OneCourses!.key, Courses);
      showToast(state: ToastStates.SUCCESS, text: "Update Done");
    }
  }
}

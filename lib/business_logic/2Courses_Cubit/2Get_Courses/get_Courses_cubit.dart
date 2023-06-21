import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../models/2Course_Model/CourseModel.dart';
import '../../../shared/components/4CustomshowToast.dart';
import '../../../shared/components/constants.dart';

part 'get_Courses_state.dart';

class GetCourseCubit extends Cubit<CourseState> {
  GetCourseCubit() : super(CourseInitial());

  List<CourseModel>? Courses1 = [];
  List<CourseModel> Courses = [];

  fetchAllCourses({required String TeacherID}) {
    Courses = [];
    Courses1 = [];
    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    Courses1 = LessonBox.values.toList();
    Courses = Courses1!.where((item) => item.TeacherId == TeacherID).toList();
    emit(CourseSuccess());
  }

  List<CourseModel>? Courses2;
  CourseModel? OneCourses;
  CourseModel NotFountModel = CourseModel(
      CoursestudentList: [],
      CourseName: "",
      CourseID: "",
      CoursePrice: "",
      officeRate: "",
      teacherRate: "",
      TeacherId: "",
      studentInf: {});

  fetchOneCourses({required String CoursesID}) {
    Courses2 = [];
    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    Courses2 = LessonBox.values.toList();

    OneCourses = Courses2!.firstWhere(
      (item) => item.CourseID == CoursesID.toString(),
      orElse: () => NotFountModel,
    );

    if (OneCourses!.CourseID == "") {
      showToast(state: ToastStates.SUCCESS, text: "Not Found");
    }
    emit(CourseOneSuccess());
  }
}

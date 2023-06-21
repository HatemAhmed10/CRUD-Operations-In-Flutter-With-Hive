import 'package:bookstore/models/2Course_Model/CourseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/2Courses_Cubit/1Add_Courses/add_Courses_cubit.dart';
import '../../../business_logic/2Courses_Cubit/2Get_Courses/get_Courses_cubit.dart';
import '../../../business_logic/2Courses_Cubit/3Update_Courses/Update_Courses_Cubit.dart';
import '../../../business_logic/2Courses_Cubit/4Delete_Course/Delete_Course_Cubit.dart';
import '../../../shared/components/7CustomTextField.dart';
import '../../../shared/components/8CustomButton.dart';
import '../../../shared/components/constants.dart';

class Course_Screen extends StatefulWidget {
  @override
  State<Course_Screen> createState() => _Course_ScreenState();
}

class _Course_ScreenState extends State<Course_Screen> {
  String? CourseID;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return GetCourseCubit()..fetchAllCourses(TeacherID: "12");
          },
        ),
        BlocProvider(
          create: (context) {
            return AddCoursesCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return UpdateCoursesCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return DeleteCoursesCubit();
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              child: BlocBuilder<GetCourseCubit, CourseState>(
                builder: (context, state) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: BlocProvider.of<GetCourseCubit>(context)
                          .Courses
                          .length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Text(BlocProvider.of<GetCourseCubit>(context)
                                  .Courses[index]
                                  .CourseID
                                  .toString()),
                              Text(BlocProvider.of<GetCourseCubit>(context)
                                  .Courses[index]
                                  .CourseName
                                  .toString()),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
            BlocBuilder<AddCoursesCubit, AddCoursesState>(
              builder: (context, state) {
                return CustomButton(
                  ButtonName: "Add",
                  onTap: () {
                    BlocProvider.of<AddCoursesCubit>(context)
                        .addCourses(CourseModel(
                      CoursestudentList: ["ST1"],
                      CourseName: "Cour3",
                      CourseID: "3",
                      CoursePrice: "100",
                      officeRate: "10",
                      teacherRate: "90",
                      TeacherId: "12",
                      studentInf: {"ST1": 2, "ST2": 1},
                    ));
                    BlocProvider.of<GetCourseCubit>(context)
                        .fetchAllCourses(TeacherID: "12");
                  },
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  border: buildBorder(),
                  enabledBorder: buildBorder(),
                  focusedBorder: buildBorder(kPrimaryColor),
                ),
                onChanged: (value) {
                  CourseID = value;
                },
              ),
            ),
            BlocBuilder<GetCourseCubit, CourseState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CustomButton(
                      ButtonName: "Get One Item",
                      onTap: () {
                        BlocProvider.of<GetCourseCubit>(context)
                            .fetchOneCourses(CoursesID: CourseID.toString());
                      },
                    ),
                    BlocProvider.of<GetCourseCubit>(context).OneCourses == null
                        ? Text("")
                        : Text(BlocProvider.of<GetCourseCubit>(context)
                            .OneCourses!
                            .CourseName),
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<UpdateCoursesCubit, UpdateCoursesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CustomButton(
                      ButtonName: "Update",
                      onTap: () {
                        BlocProvider.of<UpdateCoursesCubit>(context)
                            .UpdateCourses(
                          CoursesID: CourseID.toString(),
                          Courses: CourseModel(
                            CoursestudentList: ["ST1"],
                            CourseName: "Course1AndUpdate",
                            CourseID: "1",
                            CoursePrice: "100",
                            officeRate: "10",
                            teacherRate: "90",
                            TeacherId: "12",
                            studentInf: {"ST1": 2, "ST2": 1},
                          ),
                        );
                        BlocProvider.of<GetCourseCubit>(context)
                            .fetchAllCourses(TeacherID: "12");
                      },
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<DeleteCoursesCubit, DeleteCoursesState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CustomButton(
                      ButtonName: "Delete",
                      onTap: () {
                        BlocProvider.of<DeleteCoursesCubit>(context)
                            .DeleteCourses(
                          CoursesID: CourseID.toString(),
                        );
                        BlocProvider.of<GetCourseCubit>(context)
                            .fetchAllCourses(TeacherID: "12");
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide(
          color: color ?? const Color.fromRGBO(105, 36, 107, 1),
        ));
  }
}

import 'package:hive/hive.dart';

part 'CourseModel.g.dart';

@HiveType(typeId: 2)
class CourseModel extends HiveObject {
  @HiveField(0)
  String CourseID;
  @HiveField(1)
  String CourseName;
  @HiveField(2)
  List CoursestudentList;
  @HiveField(3)
  String CoursePrice;
  @HiveField(4)
  String officeRate;
  @HiveField(5)
  String teacherRate;
  @HiveField(6)
  String TeacherId;
  @HiveField(7)
  Map<String, int> studentInf;

  CourseModel({
    required this.CoursestudentList,
    required this.CourseName,
    required this.CourseID,
    required this.CoursePrice,
    required this.officeRate,
    required this.teacherRate,
    required this.TeacherId,
    required this.studentInf,
  });
}

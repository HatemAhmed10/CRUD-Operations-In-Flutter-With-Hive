// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseModelAdapter extends TypeAdapter<CourseModel> {
  @override
  final int typeId = 2;

  @override
  CourseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseModel(
      CourseID: fields[0] as String,
      CourseName: fields[1] as String,
      CoursestudentList: (fields[2] as List).cast<dynamic>(),
      CoursePrice: fields[3] as String,
      officeRate: fields[4] as String,
      teacherRate: fields[5] as String,
      TeacherId: fields[6] as String,
      studentInf: (fields[7] as Map)
          .map((dynamic k, dynamic v) => MapEntry(k as String, (v as int))),
    );
  }

  @override
  void write(BinaryWriter writer, CourseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.CourseID)
      ..writeByte(1)
      ..write(obj.CourseName)
      ..writeByte(2)
      ..write(obj.CoursestudentList)
      ..writeByte(3)
      ..write(obj.CoursePrice)
      ..writeByte(4)
      ..write(obj.officeRate)
      ..writeByte(5)
      ..write(obj.teacherRate)
      ..writeByte(6)
      ..write(obj.TeacherId)
      ..writeByte(7)
      ..write(obj.studentInf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

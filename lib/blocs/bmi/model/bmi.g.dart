// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BMIAdapter extends TypeAdapter<BMI> {
  @override
  final int typeId = 1;

  @override
  BMI read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BMI(
      value: fields[0] as double,
      status: fields[1] as String,
      createdAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BMI obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BMIAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appmodels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddHabitAdapter extends TypeAdapter<AddHabit> {
  @override
  final int typeId = 0;

  @override
  AddHabit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddHabit(
      HabitName: fields[0] as String,
      Frequency: (fields[1] as List).cast<bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, AddHabit obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.HabitName)
      ..writeByte(1)
      ..write(obj.Frequency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddHabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

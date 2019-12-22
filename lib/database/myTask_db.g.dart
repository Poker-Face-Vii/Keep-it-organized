// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myTask_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MytaskAdapter extends TypeAdapter<Mytask> {
  @override
  Mytask read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mytask(
      fields[0] as String,
      fields[1] as String,
      lable: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Mytask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.lable);
  }
}

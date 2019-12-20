// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myTask_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class mytaskAdapter extends TypeAdapter<mytask> {
  @override
  mytask read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return mytask(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, mytask obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.complited);
  }
}

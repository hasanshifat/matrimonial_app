// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_listed_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortListedClassAdapter extends TypeAdapter<ShortListedClass> {
  @override
  final int typeId = 1;

  @override
  ShortListedClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortListedClass(
      biodataID: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ShortListedClass obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.biodataID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortListedClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedUserModelAdapter extends TypeAdapter<CachedUserModel> {
  @override
  final int typeId = 0;

  @override
  CachedUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedUserModel(
      name: fields[0] as String,
      email: fields[1] as String,
      address: fields[2] as String,
      phoneNumber: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

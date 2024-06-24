// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authority.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthorityAdapter extends TypeAdapter<Authority> {
  @override
  final int typeId = 2;

  @override
  Authority read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Authority(
      CreatedAt: fields[0] as DateTime?,
      UpdatedAt: fields[1] as DateTime?,
      DeletedAt: fields[2] as DateTime?,
      authorityId: fields[3] as int?,
      authorityName: fields[4] as String?,
      parentId: fields[5] as int?,
      dataAuthorityId: fields[6] as String?,
      children: fields[7] as String?,
      menus: fields[8] as String?,
      defaultRouter: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Authority obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.CreatedAt)
      ..writeByte(1)
      ..write(obj.UpdatedAt)
      ..writeByte(2)
      ..write(obj.DeletedAt)
      ..writeByte(3)
      ..write(obj.authorityId)
      ..writeByte(4)
      ..write(obj.authorityName)
      ..writeByte(5)
      ..write(obj.parentId)
      ..writeByte(6)
      ..write(obj.dataAuthorityId)
      ..writeByte(7)
      ..write(obj.children)
      ..writeByte(8)
      ..write(obj.menus)
      ..writeByte(9)
      ..write(obj.defaultRouter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

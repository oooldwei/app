// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoAdapter extends TypeAdapter<UserInfo> {
  @override
  final int typeId = 1;

  @override
  UserInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfo(
      ID: fields[0] as int?,
      CreatedAt: fields[1] as DateTime?,
      UpdatedAt: fields[2] as DateTime?,
      uuid: fields[3] as String?,
      userName: fields[4] as String?,
      nickName: fields[5] as String?,
      sideMode: fields[6] as String?,
      headerImg: fields[7] as String?,
      baseColor: fields[8] as String?,
      authorityId: fields[9] as int?,
      phone: fields[10] as String?,
      email: fields[11] as String?,
      enable: fields[12] as int?,
      authority: fields[13] as Authority?,
      authorities: (fields[14] as List?)?.cast<Authority>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.ID)
      ..writeByte(1)
      ..write(obj.CreatedAt)
      ..writeByte(2)
      ..write(obj.UpdatedAt)
      ..writeByte(3)
      ..write(obj.uuid)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.nickName)
      ..writeByte(6)
      ..write(obj.sideMode)
      ..writeByte(7)
      ..write(obj.headerImg)
      ..writeByte(8)
      ..write(obj.baseColor)
      ..writeByte(9)
      ..write(obj.authorityId)
      ..writeByte(10)
      ..write(obj.phone)
      ..writeByte(11)
      ..write(obj.email)
      ..writeByte(12)
      ..write(obj.enable)
      ..writeByte(13)
      ..write(obj.authority)
      ..writeByte(14)
      ..write(obj.authorities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

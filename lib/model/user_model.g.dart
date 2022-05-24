// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      accountNumber: json['accountNumber'] as String?,
      iban: json['iban'] as String?,
      bankName: json['bankName'] as String?,
      routingNumber: json['routingNumber'] as String?,
      swiftBic: json['swiftBic'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'accountNumber': instance.accountNumber,
      'iban': instance.iban,
      'bankName': instance.bankName,
      'routingNumber': instance.routingNumber,
      'swiftBic': instance.swiftBic,
    };

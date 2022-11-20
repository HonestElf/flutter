// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['name'] as String? ?? 'Guest',
      json['user_name'] as String,
      json['email'] as String,
      UserAddress.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_name': instance.userName,
      'email': instance.email,
      'address': instance.address.toJson(),
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      json['street'] as String,
      json['zipcode'] as String,
      json['city'] as String,
      json['suite'] as String,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'street': instance.street,
      'zipcode': instance.zipcode,
      'city': instance.city,
      'suite': instance.suite,
    };

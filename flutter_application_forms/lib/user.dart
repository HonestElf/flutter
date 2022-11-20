import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String id;
  @JsonKey(defaultValue: 'Guest')
  final String name;

  @JsonKey(name: 'user_name')
  final String userName;
  final String email;

  final UserAddress address;

  User(this.id, this.name, this.userName, this.email, this.address);

//removed in serialization
  // User.fromJson(Map<String, dynamic> json)
  //     : this(
  //         json['id'],
  //         json['name'],
  //         json['userName'],
  //         json['email'],
  //       );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserAddress {
  final String street;
  final String zipcode;
  final String city;
  final String suite;

  UserAddress(
    this.street,
    this.zipcode,
    this.city,
    this.suite,
  );

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}

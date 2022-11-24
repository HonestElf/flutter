// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'hotel_details.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelDetails {
  final String uuid;
  final String name;
  final String poster;

  final HotelAddress address;

  final double price;
  final double rating;

  final HotelServicies services;

  List<String> photos;

  HotelDetails(
    this.uuid,
    this.name,
    this.poster,
    this.address,
    this.price,
    this.rating,
    this.services,
    this.photos,
  );

  factory HotelDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelAddress {
  final String country;
  final String street;
  final String city;

  @JsonKey(name: 'zip_code')
  final int zipCode;
  final HotelCoords coords;

  HotelAddress(
    this.country,
    this.street,
    this.city,
    this.zipCode,
    this.coords,
  );

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);

  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelCoords {
  final double lat;
  final double lan;

  HotelCoords(this.lat, this.lan);

  factory HotelCoords.fromJson(Map<String, dynamic> json) =>
      _$HotelCoordsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelCoordsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HotelServicies {
  final List<String> free;
  final List<String> paid;

  HotelServicies(this.free, this.paid);

  factory HotelServicies.fromJson(Map<String, dynamic> json) =>
      _$HotelServiciesFromJson(json);

  Map<String, dynamic> toJson() => _$HotelServiciesToJson(this);
}

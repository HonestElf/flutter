// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDetails _$HotelDetailsFromJson(Map<String, dynamic> json) => HotelDetails(
      json['uuid'] as String,
      json['name'] as String,
      json['poster'] as String,
      HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      (json['price'] as num).toDouble(),
      (json['rating'] as num).toDouble(),
      HotelServicies.fromJson(json['services'] as Map<String, dynamic>),
      (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelDetailsToJson(HotelDetails instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address.toJson(),
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services.toJson(),
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      json['country'] as String,
      json['street'] as String,
      json['city'] as String,
      json['zip_code'] as int,
      HotelCoords.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zipCode,
      'coords': instance.coords.toJson(),
    };

HotelCoords _$HotelCoordsFromJson(Map<String, dynamic> json) => HotelCoords(
      (json['lat'] as num).toDouble(),
      (json['lan'] as num).toDouble(),
    );

Map<String, dynamic> _$HotelCoordsToJson(HotelCoords instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelServicies _$HotelServiciesFromJson(Map<String, dynamic> json) =>
    HotelServicies(
      (json['free'] as List<dynamic>).map((e) => e as String).toList(),
      (json['paid'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelServiciesToJson(HotelServicies instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
      addressName: json['address_name'] as String,
      id: json['id'] as String,
      phone: json['phone'] as String,
      placeName: json['place_name'] as String,
      placeUrl: json['place_url'] as String,
      latitude: json['y'] as String,
      longitude: json['x'] as String);
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'address_name': instance.addressName,
      'place_name': instance.placeName,
      'place_url': instance.placeUrl,
      'y': instance.latitude,
      'x': instance.longitude,
      'id': instance.id,
      'phone': instance.phone
    };

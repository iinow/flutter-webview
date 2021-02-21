import 'package:json_annotation/json_annotation.dart';

part 'Place.g.dart';

@JsonSerializable()
class Place {
  Place(
      {this.addressName = '',
      this.id = '',
      this.phone = '',
      this.placeName = '',
      this.placeUrl = '',
      this.latitude = '',
      this.longitude = ''});

  @JsonKey(name: 'address_name')
  String addressName;

  @JsonKey(name: 'place_name')
  String placeName;

  @JsonKey(name: 'place_url')
  String placeUrl;

  @JsonKey(name: 'y')
  String latitude;

  @JsonKey(name: 'x')
  String longitude;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'phone')
  String phone;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  /// `toJson`은 클래스가 JSON 인코딩의 지원을 선언하는 규칙입니다.
  /// 이의 구현은 생성된 private 헬퍼 메서드 `_$UserToJson`을 단순히 호출합니다.
  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}

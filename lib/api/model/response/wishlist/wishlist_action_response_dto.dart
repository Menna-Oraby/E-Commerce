import 'package:json_annotation/json_annotation.dart';

part 'wishlist_action_response_dto.g.dart';

@JsonSerializable()
class WishlistActionResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  WishlistActionResponseDto ({
    this.status,
    this.message,
    this.data,
  });

  factory WishlistActionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$WishlistActionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WishlistActionResponseDtoToJson(this);
  }
}



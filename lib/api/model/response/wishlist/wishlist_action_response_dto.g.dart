// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_action_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistActionResponseDto _$WishlistActionResponseDtoFromJson(
  Map<String, dynamic> json,
) => WishlistActionResponseDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$WishlistActionResponseDtoToJson(
  WishlistActionResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

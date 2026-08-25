import 'package:json_annotation/json_annotation.dart';

part 'product_request_dto.g.dart';

@JsonSerializable()
class ProductRequestDto {
  @JsonKey(name: "productId")
  final String? productId;

  ProductRequestDto ({
    this.productId,
  });

  factory ProductRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ProductRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductRequestDtoToJson(this);
  }
}



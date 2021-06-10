import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'resp.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Resp {
  List<Item> data;

  Resp({
    this.data
  });

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);
  Map<String, dynamic> toJson() => _$RespToJson(this);

  @override
  String toString() => "{data = $data}";
}
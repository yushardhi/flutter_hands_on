import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Item {
  String name;
  String desc;
  String img;
  String listData;

  Item({
    this.name,
    this.desc,
    this.img,
    this.listData
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() => "{name = $name, desc = $desc, img = $img, listData = $listData}";
}
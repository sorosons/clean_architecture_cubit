import 'dart:convert';
import 'dart:io';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';
part 'user_model.g.dart';

List<UserModel> userFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@CopyWith()
@JsonSerializable()
class UserModel {
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "avatar")
  String? avatar;
  @JsonKey(name: "id")
  String? id;

  UserModel({this.createdAt, this.name, this.avatar, this.id});

  //to  Json
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  //fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

main() async {
  print("Deneme");
  final tJson = File("test.json");
  String content = await tJson.readAsString();

  var users = userFromJson(content);

  print(users.first.avatar);
}

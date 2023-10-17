import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class User extends Equatable {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  User({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
  });

  //With equatable we check if id is equal it is equl object
  @override
  List<Object?> get props => [id];

  // this is not using anymore converted mapper extension
  static User fromUserModel(UserModel userModel) {
    return User(
      id: userModel.id ?? "",
      createdAt: userModel.createdAt ?? "",
      name: userModel.name ?? "",
      avatar: userModel.avatar ?? "",
    );
  }
}

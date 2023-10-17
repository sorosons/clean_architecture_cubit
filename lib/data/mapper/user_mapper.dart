import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';

const EMPTY = "";
const ZERO = 0;
const NONE = "None";
const FALSE = false;

extension UserList on UserModel {
  User toUser() {
    return User(
      id: this.id ?? EMPTY,
      createdAt: this.createdAt ?? EMPTY,
      name: this.name ?? EMPTY,
      avatar: this.avatar ?? EMPTY,
    );
  }
}

extension UserListExtension on List<UserModel> {
  List<User> toUserList() {
    return map((userModel) => userModel.toUser()).toList();
  }
}

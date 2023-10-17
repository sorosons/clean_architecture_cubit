part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  UserLoadingState();
}

class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<User> users;
  @override
  List<Object?> get props => users.map((user) => user.id).toList();
}

class UserErrorState extends UserState {
  UserErrorState(this.message);
  String message;
  @override
  List<Object?> get props => [message];
}

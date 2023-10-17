import 'package:clean_arhitecture/core/utils/typedef.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';
import 'package:clean_arhitecture/domain/repository/auth_repository.dart';
import 'package:clean_arhitecture/domain/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends BaseUseCaseWithParam<void, CreateUserParams> {
  AuthRepository _authRepository;
  CreateUser(this._authRepository);

  @override
  ResultFuture call(CreateUserParams input) async {
    return _authRepository.createUser(
      createdDate: input.createdAt,
      name: input.name,
      avatar: input.avatar,
    );
  }
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });
  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [name, createdAt, avatar];
}

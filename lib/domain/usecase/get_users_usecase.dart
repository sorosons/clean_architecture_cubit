import 'package:clean_arhitecture/core/utils/typedef.dart';
import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';
import 'package:clean_arhitecture/domain/repository/auth_repository.dart';
import 'package:clean_arhitecture/domain/usecase/base_usecase.dart';

class GetUsersUseCase extends BaseUseCaseWithoutParams<List<User>> {
  AuthRepository _authRepository;
  GetUsersUseCase(this._authRepository);
  @override
  ResultFuture<List<User>> call() async {
    return _authRepository.getUser();
  }
}

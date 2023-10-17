import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/data/network/app_api.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';

abstract class UserRemoteSource {
  Future<UserModel> createUser(User user);
  Future<List<UserModel>> getUser();
}

class UserRemoteSourceImp implements UserRemoteSource {
  UserRemoteSourceImp(this._appServiceClient);
  AppServiceClient _appServiceClient;

  @override
  Future<UserModel> createUser(User user) async {
    return await _appServiceClient.createUser(
        user.createdAt, user.name, user.avatar);
  }

  @override
  Future<List<UserModel>> getUser() async {
    return await _appServiceClient.getUsers();
  }
}

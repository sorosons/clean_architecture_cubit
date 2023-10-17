import 'package:clean_arhitecture/core/failure.dart';
import 'package:clean_arhitecture/core/utils/typedef.dart';
import 'package:clean_arhitecture/data/datasources/user_remoteSource.dart';
import 'package:clean_arhitecture/data/mapper/user_mapper.dart';
import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/data/network/network_info.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';
import 'package:clean_arhitecture/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepository {
  AuthRepoImpl(this._userRemoteSource, this._networkInfo);
  UserRemoteSource _userRemoteSource;
  NetworkInfo _networkInfo;

  @override
  ResultFuture<User> createUser(
      {required String name,
      required String createdDate,
      required String avatar}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUser() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _userRemoteSource.getUser();

        return Right(response.toUserList());
      } catch (e) {
        return Left(Failure(message: "Hata", statusCode: 400));
      }
    } else {
      return Left(Failure(message: "Internet Yok", statusCode: 400));
    }
  }
}

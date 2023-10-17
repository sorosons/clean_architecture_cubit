import 'package:clean_arhitecture/core/failure.dart';
import 'package:clean_arhitecture/core/utils/typedef.dart';
import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  ResultFuture<User> createUser({
    required String name,
    required String createdDate,
    required String avatar,
  });

  ResultFuture<List<User>> getUser();
}

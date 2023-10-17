import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

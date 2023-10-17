import 'package:clean_arhitecture/data/datasources/user_remoteSource.dart';
import 'package:clean_arhitecture/data/network/app_api.dart';
import 'package:clean_arhitecture/data/network/network_info.dart';
import 'package:clean_arhitecture/data/repository_imp/auth_repository_imp.dart';
import 'package:clean_arhitecture/domain/repository/auth_repository.dart';
import 'package:clean_arhitecture/domain/usecase/get_users_usecase.dart';
import 'package:clean_arhitecture/presentation/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';

import '../data/network/dio_factory.dart';

GetIt instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => UserCubit(getUsersUseCase: instance()));

  instance.registerLazySingleton(() => GetUsersUseCase(instance()));

  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepoImpl(instance(), instance()));

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  instance.registerLazySingleton<UserRemoteSource>(
      () => UserRemoteSourceImp(instance()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
}

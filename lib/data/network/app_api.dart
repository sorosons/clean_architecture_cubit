import 'package:clean_arhitecture/core/constant.dart';
import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:clean_arhitecture/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

class ApisEndpoint {
  static const String getUser = "/user";
}

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @GET(ApisEndpoint.getUser)
  Future<List<UserModel>> getUsers();

  @POST(ApisEndpoint.getUser)
  Future<UserModel> createUser(
    @Field("createdAt") String createdAt,
    @Field("name") String name,
    @Field("avatar") String avatar,
  );
}

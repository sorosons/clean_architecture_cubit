import 'package:clean_arhitecture/domain/repository/auth_repository.dart';
import 'package:clean_arhitecture/domain/usecase/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

main() {
  late CreateUser _createUser;
  late AuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    _createUser = CreateUser(mockAuthRepository);
  });

  final testParams = const CreateUserParams(
    createdAt: '2023-09-15',
    name: 'John Doe',
    avatar: 'avatar_url',
  );

  test("should create a user from the repository", () async {
    // Arrange
    when(() => mockAuthRepository.createUser(
            name: any(named: 'name'),
            createdDate: any(named: 'createdDate'),
            avatar: any(named: 'avatar')))
        .thenAnswer((_) async => const Right(null));
    // Act
    final result = await _createUser(testParams);

    // Assert
    expect(
        result,
        equals(const Right<dynamic, void>(
            null))); // Assuming your ResultFuture type is Either<Failure, T>
    verify(() {
      return mockAuthRepository.createUser(
          name: testParams.name,
          createdDate: testParams.createdAt,
          avatar: testParams.avatar);
    }).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}

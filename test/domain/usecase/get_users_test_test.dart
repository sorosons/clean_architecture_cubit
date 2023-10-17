import 'package:clean_arhitecture/domain/entities/user.dart';
import 'package:clean_arhitecture/domain/repository/auth_repository.dart';
import 'package:clean_arhitecture/domain/usecase/get_users_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetUsersMockApi extends Mock implements AuthRepository {}

main() {
  late GetUsersMockApi _repositoty;
  late GetUsersUseCase _usecase;

  setUp(() {
    _repositoty = GetUsersMockApi();
    _usecase = GetUsersUseCase(_repositoty);
  });

  final testUsers = [
    User(id: "1", name: 'Alice', createdAt: "Bugun", avatar: "Avatar"),
    User(id: "2", name: 'Alicec', createdAt: "Bugun", avatar: "Avatar"),
  ];

  test('should get a list of users from the repository', () async {
    // Arrange
    when(() => _repositoty.getUser()).thenAnswer((_) async => Right(testUsers));

    // Act
    final result = await _usecase();

    // Assert
    expect(result, equals(Right(testUsers)));
    verify(() => _repositoty.getUser()).called(1);
    verifyNoMoreInteractions(_repositoty);
  });
}

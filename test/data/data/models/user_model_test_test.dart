import 'package:clean_arhitecture/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel Tests', () {
    test('fromJson() should convert JSON to UserModel object', () {
      // Arrange
      Map<String, dynamic> json = {
        'createdAt': '2023-09-15',
        'name': 'John Doe',
        'avatar': 'avatar_url',
        'id': '12345'
      };

      // Act
      UserModel userModel = UserModel.fromJson(json);

      // Assert
      expect(userModel.createdAt, '2023-09-15');
      expect(userModel.name, 'John Doe');
      expect(userModel.avatat, 'avatar_url');
      expect(userModel.id, '12345');
    });

    test('toJson() should convert UserModel object to JSON', () {
      // Arrange
      UserModel userModel = UserModel(
        createdAt: '2023-09-15',
        name: 'John Doe',
        avatat: 'avatar_url',
        id: '12345',
      );

      // Act
      Map<String, dynamic> json = userModel.toJson();

      // Assert
      expect(json['createdAt'], '2023-09-15');
      expect(json['name'], 'John Doe');
      expect(json['avatar'], 'avatar_url');
      expect(json['id'], '12345');
    });

    test('copyWith() should create a new UserModel with updated values', () {
      // Arrange
      UserModel originalUser = UserModel(
        createdAt: '2023-09-15',
        name: 'John Doe',
        avatat: 'avatar_url',
        id: '12345',
      );

      // Act
      UserModel updatedUser = originalUser.copyWith(name: 'Jane Doe');

      // Assert
      expect(updatedUser.name, 'Jane Doe');
      expect(updatedUser.createdAt, originalUser.createdAt);
      expect(updatedUser.avatat, originalUser.avatat);
      expect(updatedUser.id, originalUser.id);
    });
  });
}

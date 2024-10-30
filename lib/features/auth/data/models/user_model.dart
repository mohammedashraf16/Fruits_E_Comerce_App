import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
  });

  factory UserModel.formJson(User user) {
    return UserModel(
      name: user.displayName??"",
      email: user.email??"",
      uId: user.uid,
    );
  }
}

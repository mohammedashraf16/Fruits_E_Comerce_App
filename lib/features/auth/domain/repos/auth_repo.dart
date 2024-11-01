import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
}

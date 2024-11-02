import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/exception.dart';
import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/core/services/firebase_auth_service.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.formJson(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}");
      return Left(ServerFailure("لقد حدث خطأ ما. الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(String email, String password) async{

      try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.formJson(user));
    } on CustomException catch (e) {
        return Left(ServerFailure(e.message));
      }
      catch (e) {
        log("Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}");
        return Left(ServerFailure("لقد حدث خطأ ما. الرجاء المحاوله مره اخري"));
      }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async{
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.formJson(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}");
      return Left(ServerFailure("لقد حدث خطأ ما. الرجاء المحاوله مره اخري"));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async{
    try {
      var user =await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.formJson(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log("Exception in AuthRepoImpl.signInWithFacebook : ${e.toString()}");
      return Left(ServerFailure("لقد حدث خطأ ما. الرجاء المحاوله مره اخري"));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }

  Future<void> signInWithApple() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithApple();
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        emit(SignInSuccess(userEntity: user));
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:fruits_app/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repos/auth_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) {
        emit(SignupFailure(errorMessage: failure.errorMessage));
      },
      (userEntity) {
        emit(SignupSuccess(userEntity: userEntity));
      },
    );
  }
}
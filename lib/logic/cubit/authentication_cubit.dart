import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/constants/enums.dart';
import '../../data/models/default_user.dart';
import '../../data/repositories/user_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationCubit() : super(AuthenticationInitial());

  Future<void> signUp({
    @required String email,
    @required String password,
    @required String name,
    @required String phoneNumber,
    @required String pincode,
    @required AccountType accountType,
  }) async {
    emit(AuthenticationLoading());
    try {
      final user = await _userRepository.createAccount(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        pincode: pincode,
        accountType: accountType,
      );
      if (user is DefaultUser) {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthenticationError(e.message));
    }
  }

  Future<void> signIn({
    @required String email,
    @required String password,
  }) async {
    emit(AuthenticationLoading());
    try {
      final user = await _userRepository.signIn(
        email: email,
        password: password,
      );
      if (user is DefaultUser) {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthenticationError(e.message));
    }
  }

  Future<void> signOut() async {
    _userRepository.signOut().then((value) => emit(AuthenticationDone()));
  }
}

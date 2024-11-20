import 'package:bloc/bloc.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/features/log_in/domain/entities/user_entity.dart';
import 'package:easy_pms/features/log_in/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequest>((event, emit) async {
      final result = await getInstance<LoginUsecase>().call(event.entity);
      result.fold((l) {
        emit(LoginError(message: l));
      }, (r) {
        print('done');
        emit(LoginProcess());
      });
    });
  }
}

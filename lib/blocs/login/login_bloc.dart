import 'package:blocpracticeapp/blocs/login/login_events.dart';
import 'package:blocpracticeapp/blocs/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc {
  LoginBloc() : super(LoginInitailState()) {
    on<LoginButtonPressedEvent>((event, emit) {
      if (event.globalKey.currentState!.validate()) {}
    });
  }
}

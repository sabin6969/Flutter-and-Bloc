import 'dart:async';

import 'package:blocpracticeapp/blocs/internet/internet_event.dart';
import 'package:blocpracticeapp/blocs/internet/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetBloc() : super(InternetState()) {
    on<InternetAvaiableEvent>((event, emit) {
      emit(
        InternetConnectivityAvailableState(),
      );
    });
    on<InternetUnavaiableEvent>((event, emit) {
      emit(
        InternetConnectivityUnavailableState(),
      );
    });
    _streamSubscription = _connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
          add(InternetAvaiableEvent());
        } else {
          add(
            InternetUnavaiableEvent(),
          );
        }
      },
    );
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

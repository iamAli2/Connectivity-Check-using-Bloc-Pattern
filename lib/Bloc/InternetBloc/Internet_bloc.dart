import 'dart:async';

import 'package:firstbloc/Bloc/InternetBloc/Internet_events.dart';
import 'package:firstbloc/Bloc/InternetBloc/Iterrnet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectedSubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
    on<InternetLosEvent>((event, emit) => emit(InternetLostState()));

    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLosEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _connectedSubscription?.cancel();
    return super.close();
  }
}

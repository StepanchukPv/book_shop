import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_inv/core/home_bloc/home_event.dart';
import 'package:sentry_inv/core/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState([])) {
    on<HomeLoadEvent>(_onLoadEvent);
  }

  void load() => add(HomeLoadEvent());

  FutureOr<void> _onLoadEvent(
    HomeLoadEvent event,
    Emitter<HomeState> emit,
  ) async {
    Future.delayed(
      const Duration(seconds: 2),
    );

    emit(
      state.copyWith(
        strs: ['test'],
      ),
    );
  }
}

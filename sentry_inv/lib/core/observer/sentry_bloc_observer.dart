import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SentryBlocObserver extends BlocObserver {
  SentryBlocObserver({Hub? hub}) : _hub = hub ?? HubAdapter();

  final Hub _hub;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    _hub.addBreadcrumb(
      Breadcrumb(
        type: 'bloc',
        category: 'onEvent',
        message: event?.toString(),
        data: {
          'bloc': bloc.runtimeType,
        },
      ),
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    _hub.addBreadcrumb(
      Breadcrumb(
        type: 'bloc',
        category: 'onChange',
        message: change.toString(),
        data: {
          'bloc': bloc.runtimeType,
        },
      ),
    );
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _hub.addBreadcrumb(
      Breadcrumb(
        type: 'bloc',
        category: 'onTransition',
        message: transition.toString(),
        data: {
          'bloc': bloc.runtimeType,
        },
      ),
    );
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    _hub.addBreadcrumb(
      Breadcrumb(
        type: 'bloc',
        category: 'onClose',
        data: {
          'bloc': bloc.runtimeType,
        },
      ),
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    final mechanism = Mechanism(
      type: 'BlocObserver.onError',
      handled: false,
    );

    final throwableMechanism = ThrowableMechanism(mechanism, error);

    final event = SentryEvent(
      throwable: throwableMechanism,
      level: SentryLevel.fatal,
    );

    _hub.captureEvent(event, stackTrace: stackTrace);
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:notification_ui/core/services/routes/routes_names.dart';
import 'package:notification_ui/core/widgets/sn_connection_error.dart';
import 'package:notification_ui/core/widgets/sn_undefined_route.dart';
import 'package:notification_ui/modules/core/presentation/screens/sn_profile.dart';
import 'package:notification_ui/modules/core/presentation/screens/sn_splash.dart';

/// [Routes] is a class that contains all the routes in the app.
class Routes {
  /// [buildRoutes] is a function that build all the routes in the app.
  static void buildRoutes(RouteManager r) {
    r.child(
      RoutesNames.appInit,
      transition: TransitionType.fadeIn,
      child: (_) => const SNSplash(),
    );

    //------------- Home Routes -------------//
    r.child(
      RoutesNames.home.homeMain,
      transition: TransitionType.fadeIn,
      child: (_) => const SNProfile(),
    );
    //------------- End Home Routes -------------//

    r.child(
      RoutesNames.connectionError,
      transition: TransitionType.fadeIn,
      child: (_) => const SNConnectionError(),
    );

    //------------- Undefined Route Screen -------------//
    r.wildcard(
      transition: TransitionType.fadeIn,
      child: (_) => const SNUndefinedRoute(),
    );
  }
}

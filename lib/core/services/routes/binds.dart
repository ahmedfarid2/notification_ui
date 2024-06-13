import 'package:flutter_modular/flutter_modular.dart';
import 'package:notification_ui/modules/core/presentation/state_managment/app_core_cubit.dart';

/// [Binds] is a class that contains all the dependencies that will be used in the app.
class Binds {
  /// [binds] is a function that bind all dependencies.
  static void binds(Injector i) {
    // ========== Clean Arch ========== //
    /// Start [Global] dependencies.
    i.addSingleton(AppCoreCubit.new);
  }
}

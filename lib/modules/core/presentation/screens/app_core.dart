import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notification_ui/core/constants/constants.dart';
import 'package:notification_ui/core/services/routes/app_modular_opserver.dart';
import 'package:notification_ui/core/theme/app_theme.dart';
import 'package:notification_ui/modules/core/presentation/state_managment/app_core_cubit.dart';

class AppCore extends StatefulWidget {
  const AppCore({super.key});

  @override
  State<AppCore> createState() => _AppCoreState();
}

class _AppCoreState extends State<AppCore> {
  @override
  void initState() {
    super.initState();
    Modular.to.setObservers([
      AppModularObserver(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppCoreCubit>(
              create: (BuildContext context) => AppCoreCubit(),
            ),
          ],
          child: MaterialApp.router(
            title: Constants.constValues.appName,
            theme: AppTheme.lightTheme(),
            debugShowCheckedModeBanner: false,
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            builder: (BuildContext context, Widget? child) {
              return child ?? Container();
            },
          ),
        );
      },
    );
  }
}

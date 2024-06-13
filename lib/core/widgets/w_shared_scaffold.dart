import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_ui/core/assets/assets.gen.dart';
import 'package:notification_ui/core/extension/color_extension.dart';
import 'package:notification_ui/core/extension/context_extension.dart';
import 'package:notification_ui/core/extension/int_extension.dart';
import 'package:notification_ui/core/extension/text_theme_extension.dart';
import 'package:notification_ui/core/services/routes/routes_names.dart';
import 'package:notification_ui/modules/core/presentation/state_managment/app_core_cubit.dart';

class WSharedScaffold extends StatefulWidget {
  const WSharedScaffold({
    super.key,
    required this.body,
    this.withBackButton = true,
    this.onBackButtonTap,
    this.onNotification,
    this.onPreferences,
    this.title,
  });

  final String? title;
  final Widget body;
  final bool withBackButton;
  final Function()? onBackButtonTap;
  final Function()? onNotification;
  final Function()? onPreferences;

  @override
  State<WSharedScaffold> createState() => _WSharedScaffoldState();
}

class _WSharedScaffoldState extends State<WSharedScaffold> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCoreCubit, AppCoreState>(
      bloc: Modular.get<AppCoreCubit>(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.naturalColor8,
          body: Column(
            children: [
              Stack(
                children: [
                  /// [Linear BackGround]
                  ClipPath(
                    clipper: TopWaveClipper(),
                    child: Container(
                      height: 177.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            context.theme.colorScheme.bgColor1,
                            context.theme.colorScheme.bgColor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  /// [BackGround image]
                  Container(
                    padding: EdgeInsets.only(
                      right: 8.w,
                      left: 8.w,
                      top: 10.h,
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          Assets.icons.bgIcons1.path,
                          height: 62.01.h,
                        ),
                        17.createVerticalGap,
                        SvgPicture.asset(
                          Assets.icons.bgIcons1.path,
                          height: 47.55.h,
                        ),
                      ],
                    ),
                  ),
                  ///profile Image
                  Positioned(
                    top: 120.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 88.w,
                      height: 88.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4.w,
                        ),
                        image: DecorationImage(
                          image: AssetImage(Assets.icons.image1.path),
                          fit: BoxFit.contain,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.theme.colorScheme.shadowColor,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///Preferences
                  (widget.onPreferences != null)
                      ? Positioned(
                          right: 10.w,
                          top: 110.h,
                          child: InkWell(
                            onTap: widget.onNotification,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  width: 15.w,
                                  height: 16.h,
                                  Assets.icons.preferences.path,
                                  colorFilter: ColorFilter.mode(
                                    context.theme.colorScheme.secondaryColor1,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                8.createHorizontalGap,
                                Text(
                                  'Preferences',
                                  style: context.textTheme.titleSemiBold_10.copyWith(
                                    color: context.theme.colorScheme.secondaryColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 30.w,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///[AppBar]
                      Container(
                        padding: EdgeInsets.only(
                          top: 56.h,
                          left: 35.w,
                          right: 29.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                (widget.withBackButton)
                                    ? InkWell(
                                        onTap: widget.onBackButtonTap ??
                                            () {
                                              Modular.to.navigate(
                                                RoutesNames.appInit,
                                              );
                                            },
                                        child: SvgPicture.asset(
                                          width: 26.w,
                                          height: 10.h,
                                          Assets.icons.arrowBack.path,
                                          colorFilter: ColorFilter.mode(
                                            context.theme.colorScheme.tertiaryColor0,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 26.w,
                                        height: 10.h,
                                      ),
                                10.createHorizontalGap,
                                Text(
                                  widget.title ?? '',
                                  style: context.textTheme.titleSemiBold_18.copyWith(
                                    color: context.theme.colorScheme.naturalColor6,
                                  ),
                                ),
                              ],
                            ),
                            (widget.onNotification != null)
                                ? Align(
                                    child: InkWell(
                                      onTap: widget.onNotification,
                                      child: SvgPicture.asset(
                                        width: 30.w,
                                        height: 30.h,
                                        Assets.icons.notifaction.path,
                                        colorFilter: ColorFilter.mode(
                                          context.theme.colorScheme.secondaryColor1,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: 30.w,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  220.createVerticalGap,
                ],
              ),

              ///[Body]
              Expanded(
                child: Container(
                  color: context.theme.colorScheme.naturalColor8,
                  child: widget.body,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.lineTo(0, height - 40);
    path.lineTo(width / 2, height);
    path.lineTo(width, height - 40);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

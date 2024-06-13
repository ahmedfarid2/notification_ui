import 'package:flutter/material.dart';
import 'package:notification_ui/core/extension/color_extension.dart';
import 'package:notification_ui/core/extension/context_extension.dart';
import 'package:notification_ui/core/extension/text_theme_extension.dart';
import 'package:notification_ui/core/widgets/w_shared_scaffold.dart';

class SNUndefinedRoute extends StatelessWidget {
  const SNUndefinedRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      title: "Undefined Route",
      body: Center(
        child: Text(
          "Undefined Route",
          style: context.textTheme.titleMedium_18.copyWith(
            color: context.theme.colorScheme.naturalColor2,
          ),
        ),
      ),
    );
  }
}

import 'package:notification_ui/core/utils/enums.dart';

class CSTConstValues {
  String appVersion = '';

  final String appName = 'Notification UI';
  final APIState apiState = APIState.test;
  final String appApiKey = '';
  final String appTestKey = '';

  String get getAppKey => apiState == APIState.test ? appTestKey : appApiKey;

  bool isNetworkDisconnected = false;

}
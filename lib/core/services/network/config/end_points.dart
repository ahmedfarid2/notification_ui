import 'package:notification_ui/core/constants/constants.dart';
import 'package:notification_ui/core/utils/enums.dart';

class APIEndPoints {
  static const String baseApiUrl = "";
  static const String baseTestUrl = "";

  static String get baseUrl => APIState.test == Constants.constValues.apiState ? baseTestUrl : baseApiUrl;

  static Auth auth = Auth();
}

class Auth {
  /// [Login]
  String get login => "${APIEndPoints.baseUrl}/login/";

  /// [Registration]
  String get register => "${APIEndPoints.baseUrl}/signup/";
}

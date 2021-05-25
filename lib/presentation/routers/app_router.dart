import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/dashboard_screen/customer_dashboard_screen.dart';
import '../screens/dashboard_screen/merchant_dashboard_screen.dart';
import '../screens/intro_screen/intro_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/qr_display_screen/qr_display_screen.dart';
import '../screens/qr_scan_screen/qr_scan_screen.dart';
import '../screens/register_screen/register_screen.dart';

class AppRouter {
  static const intro = IntroScreen.route;
  static const register = RegisterScreen.route;
  static const login = LoginScreen.route;
  static const customer_dashboard = CustomerDashBoardScreen.route;
  static const merchant_dashboard = MerchantDashBoardScreen.route;
  static const qr_scan = QrScanScreen.route;
  static const qr_display = QrDisplayScreen.route;

  AppRouter._();
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case IntroScreen.route:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case RegisterScreen.route:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case LoginScreen.route:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case CustomerDashBoardScreen.route:
        return MaterialPageRoute(builder: (_) => CustomerDashBoardScreen());
      case MerchantDashBoardScreen.route:
        return MaterialPageRoute(builder: (_) => MerchantDashBoardScreen());
      case QrDisplayScreen.route:
        return MaterialPageRoute(builder: (_) => QrDisplayScreen());
      case QrScanScreen.route:
        return MaterialPageRoute(builder: (_) => QrScanScreen());
      default:
        throw const RouteException('Invalid Route!');
    }
  }
}

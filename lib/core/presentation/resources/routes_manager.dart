import 'package:chart/core/app/di.dart';
import 'package:chart/features/log%20in/presintation/view/login_page.dart';
import 'package:chart/pages/hello_page.dart';
import 'package:chart/features/sign%20up/presintation/view/sign_up_page.dart';
import 'package:chart/features/add%20new%20message/presintation/view/glp_avatar.dart';
import 'package:chart/pages/home.dart';
import 'package:chart/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../pages/all_conversations.dart';
import '../../../pages/chat_screen.dart';
import '../../../pages/splash_screen.dart';

class Routes {
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String avatarRoute = "/avatar";
  static const String onboardingRoute = "/onboarding";
  static const String test = "/test";
  static const String helloPage = "/helloPage";
  static const String home = "/home";
  static const String homeScreen = "/homeScreen";
  static const String allConversations = "/allConversations";
  static const String chatScreen = "/chatScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerRoute:
        initSignUpModule();
        return MaterialPageRoute(builder: (_) => SignUpPage());

      case Routes.loginRoute:
        initLogInModule();
        return MaterialPageRoute(builder: (_) => LoginPage());

      case Routes.avatarRoute:
        initAddMessageModule();
        // initAiModelModule();
        return MaterialPageRoute(builder: (_) => const Avatar());

      case Routes.helloPage:
        return MaterialPageRoute(builder: (_) => const HelloPage());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Home());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.allConversations:
        return MaterialPageRoute(builder: (_) => const AllConversations());
      case Routes.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.noRouteFound.tr()),
        ),
        body: Center(child: Text(LocaleKeys.noRouteFound.tr())),
      ),
    );
  }
}

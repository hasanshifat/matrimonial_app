import 'package:flutter/material.dart';
import 'package:matrimonial_app/Login/Pages/login_page.dart';
import '../Short Listed/Pages/shortlist_details_page.dart';
import '../Short Listed/Pages/shortlist_page.dart';
import '../SignUp/Pages/otp_verify.dart';
import '../SignUp/Pages/registration_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RegistrationPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegistrationPage(),
      );

    case LoginPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case OtpVerifyPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OtpVerifyPage(),
      );
    case ShortListPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ShortListPage(),
      );

    case ShortListDetailsPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ShortListDetailsPage(),
      );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    // case ProductDetailScreen.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailScreen(
    //       product: product,
    //     ),
    //   );
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddressScreen(
    //       totalAmount: totalAmount,
    //     ),
    //   );
    // case OrderDetailScreen.routeName:
    //   var order = routeSettings.arguments as Order;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => OrderDetailScreen(
    //       order: order,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}

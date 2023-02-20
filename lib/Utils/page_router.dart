import 'package:flutter/material.dart';
import 'package:matrimonial_app/Login/Pages/login_page.dart';
import '../BioData/Pages/bio_data_page.dart';
import '../Biodata Request/Model/pending_request_model.dart';
import '../Biodata Request/Pages/biodata_details_page.dart';
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
    case BioDataPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BioDataPage(),
      );
    case BioDataRequestDetailsPage.routeName:
      var p = routeSettings.arguments as PendingRequestModel;
      int listIndex = routeSettings.arguments as int;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BioDataRequestDetailsPage(
          p: p,
          listIndex: listIndex,
        ),
      );
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

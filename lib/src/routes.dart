
import 'package:flutter/material.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/features/task/presentation/screens/dashboard.dart';
import 'package:test_firebase/features/task/presentation/screens/task_detail_screen.dart';


//const userName = '/user_name_screen';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String taskDetailScreen = '/task_detail_screen';

 

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      
      case taskDetailScreen:
        return MaterialPageRoute(
            builder: (_) => TaskdetailsScreen(
                  tasks: settings.arguments as Task,
                ));
      // case designRequestScreen:
      //   return MaterialPageRoute(builder: (_) => const DesignRequestScreen());

      // case designRequestDetailsScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => DesignRequestDetailsScreen(
      //             id: settings.arguments as int?,
      //           ));
      // case addDesignRequestDetailsScreen:
      //   return MaterialPageRoute(builder: (_) => AddDesignRequestScreen());
      // case addCustomerDesignRequestcreen:
      //   return MaterialPageRoute(
      //       builder: (_) => AddCustomerDesignRequestScreen());
      // case addNewPart:
      //   return MaterialPageRoute(
      //       builder: (_) => AddNewPart(
      //             product: settings.arguments as Product,
      //           ));
      //            case viewInvoiceScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => InvoiceScreen(
      //             orderDetailsModel: settings.arguments as OrderDetailsModel,
      //           ));

      default:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
    }
  }
}

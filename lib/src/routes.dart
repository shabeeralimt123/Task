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

      default:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
    }
  }
}

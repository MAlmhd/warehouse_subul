import 'package:flutter/material.dart';
import 'package:warehouse_subul/core/routing/routes.dart';
import 'package:warehouse_subul/features/warehouse_manager/ui/widgets/warehouse_manager.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
       case Routes.warehouseManager:
        return MaterialPageRoute(builder: (_) => WarehouseManager());
      default:
        return null;
    }
  }
}

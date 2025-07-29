import 'package:flutter/material.dart';
import 'package:warehouse_subul/core/routing/routes.dart';
import 'package:warehouse_subul/features/get_all_parcels/presentation/views/show_all_parcels.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/show_parcels_of_specific_shipment.dart';
import 'package:warehouse_subul/features/warehouse_manager/ui/widgets/warehouse_manager.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.warehouseManager:
        return MaterialPageRoute(builder: (_) => WarehouseManager());
      case Routes.showAllParcels:
        return MaterialPageRoute(builder: (_) => ShowAllParcels());
        case Routes.showParcelsOfSpecificShipment :
        final shipmentId = arguments as int;
        return   MaterialPageRoute(builder: (_) => ShowParcelsOfSpecificShipment(shipmentId: shipmentId,));
      default:
        return null;
    }
  }
}

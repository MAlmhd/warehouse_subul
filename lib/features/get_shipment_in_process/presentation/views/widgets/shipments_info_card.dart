import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warehouse_subul/core/helpers/assets_data.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/extensions.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/routing/routes.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/custom_item_in_show_all_parcels_table.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/shipment_in_process_entity/shipment_in_process_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_drivers_use_case/get_drivers_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_shipment_details_use_case/get_shipment_details_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_destenation_country_use_case/update_shipment_destenation_country_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_for_delivery_use_case/update_shipment_for_delivery_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_origin_country_use_case/update_shipment_origin_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/get_drivers_cubit/get_drivers_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/get_shipment_details/get_shipment_details_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_destenation_country_cubit/update_shipment_destenation_country_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_for_delivery_cubit/update_shipment_for_delivery_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_origin_country_cubit/update_shipment_origin_country_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/country_switch_container.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/shipment_receipt.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/upload_number_image_and_name_of_driver_shipment.dart';

// ✅ عرض البيانات في صفوف أفقية متراصة مع ترويسة ثابتة
class ShipmentInfoCard extends StatelessWidget {
  final ShipmentInProcessEntity? shipment;

  const ShipmentInfoCard({super.key, this.shipment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.lightGray2,
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            child: Row(
              children: [
                Expanded(flex: 3, child: _buildCell(shipment!.trackingNumber)),
                Expanded(flex: 2, child: _buildCell(shipment!.originCountry)),
                Expanded(
                  flex: 2,
                  child: _buildCell(shipment!.destinationCountry),
                ),
                Expanded(
                  flex: 1,
                  child: _buildCell(shipment!.declaredParcelsCount.toString()),
                ),
                Expanded(
                  flex: 2,
                  child: _buildCell(_formatDate(shipment!.dateOfShipment)),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: Colors.black87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'details':
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder:
                              (_) => BlocProvider(
                                create:
                                    (context) => GetShipmentDetailsCubit(
                                      sl.get<GetShipmentDetailsUseCase>(),
                                    )..getShipmentDetails(
                                      idShipment: shipment!.id,
                                    ),
                                child: ShipmentReceipt(),
                              ),
                        );
                        break;

                      case 'driver':
                        context.pushNamed(
                          Routes.uploadNameAndNumberOfDriver,
                          arguments: shipment!.id,
                        );
                        break;
                      case 'edit':
                        context.pushNamed(
                          Routes.editCountry,
                          arguments: shipment!.id,
                        );
                        break;
                      case 'parcels':
                        context.pushNamed(
                          Routes.showParcelsOfSpecificShipment,
                          arguments: shipment!.id,
                        );
                        break;
                      case 'create parcel':
                        context.pushNamed(Routes.createParcel,arguments: shipment!.id);
                        break;
                    }
                  },
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(
                          value: 'details',
                          child: Text('عرض التفاصيل'),
                        ),
                        PopupMenuItem(
                          value: 'driver',
                          child: Text('تعيين سائق'),
                        ),
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('تعديل الشحنة'),
                        ),
                        PopupMenuItem(
                          value: 'parcels',
                          child: Text('عرض الطرود'),
                        ),
                        PopupMenuItem(
                          value: 'create parcel',
                          child: Text('انشاء طرود'),
                        ),
                      ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCell(String value) {
    return Text(
      value,
      style: Styles.textStyle5Sp.copyWith(color: Colors.black),
      overflow: TextOverflow.ellipsis,
    );
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return '${date.year}-${date.month}-${date.day}';
    } catch (_) {
      return isoDate;
    }
  }
}

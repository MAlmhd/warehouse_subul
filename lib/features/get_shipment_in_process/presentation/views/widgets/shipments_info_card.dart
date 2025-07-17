import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warehouse_subul/core/helpers/assets_data.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/shipment_in_process_entity/shipment_in_process_entity.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/get_drivers_use_case/get_drivers_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_destenation_country_use_case/update_shipment_destenation_country_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/use_case/update_shipment_origin_country_use_case/update_shipment_origin_use_case.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/get_drivers_cubit/get_drivers_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_destenation_country_cubit/update_shipment_destenation_country_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_origin_country_cubit/update_shipment_origin_country_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/country_switch_container.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/upload_number_image_and_name_of_driver_shipment.dart';

class ShipmentInfoCard extends StatelessWidget {
  final ShipmentInProcessEntity? shipment;

  const ShipmentInfoCard({super.key, this.shipment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder:
                    (_) => BlocProvider(
                      create: (context) => GetDriversCubit(sl.get<GetDriversUseCase>())..getDrivers(),
                      child: const UploadNumberImageAndNameOfDriverShipment(),
                    ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.lightGray2,
                borderRadius: BorderRadius.circular(cornerRadius),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.goldenYellow,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      AssetsData.box,
                      width: 30.w,
                      height: 30.w,
                    ),
                  ),
                  SizedBox(width: 16.w),

                  Expanded(
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLine('', shipment!.trackingNumber),
                        _buildLine('البلد المصدر:', shipment!.originCountry),
                        _buildLine(
                          'البلد الوجهة:',
                          shipment!.destinationCountry,
                        ),
                        _buildLine(
                          'عدد الطرود:',
                          shipment!.declaredParcelsCount.toString(),
                        ),
                        _buildLine(
                          'تاريخ الشحن:',
                          _formatDate(shipment!.dateOfShipment),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✏️ زر التعديل
          Positioned(
            top: 1,
            right: 4,
            child: IconButton(
              iconSize: 5,
              icon: Icon(Icons.edit, size: 8.sp, color: AppColors.goldenYellow),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create:
                              (context) => UpdateShipmentOriginCountryCubit(
                                sl.get<UpdateShipmentOriginUseCase>(),
                              ),
                        ),
                        BlocProvider(
                          create:
                              (
                                context,
                              ) => UpdateShipmentDestenationCountryCubit(
                                sl
                                    .get<
                                      UpdateShipmentDestenationCountryUseCase
                                    >(),
                              ),
                        ),
                      ],
                      child: CountrySwitchContainer(idShipment: shipment!.id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: Styles.textStyle5Sp.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: value,
              style: Styles.textStyle5Sp.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return '${date.day}-${date.month}-${date.year}';
    } catch (_) {
      return isoDate;
    }
  }
}

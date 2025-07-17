import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/core/utils/functions/show_snack_bar.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_destenation_country_cubit/update_shipment_destenation_country_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_origin_country_cubit/update_shipment_origin_country_cubit.dart';
class CountrySwitchContainer extends StatefulWidget {
  const CountrySwitchContainer({super.key, required this.idShipment});
  final int idShipment;

  @override
  State<CountrySwitchContainer> createState() => _CountrySwitchContainerState();
}

class _CountrySwitchContainerState extends State<CountrySwitchContainer> {
  bool isDestinationUAE = true;
  bool isOriginUAE = true;

  bool originSuccess = false;
  bool destinationSuccess = false;

  void checkAndCloseIfDone() {
    if (originSuccess && destinationSuccess) {
      showSnackBar(context, 'تم التحديث بنجاح', Colors.green);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateShipmentOriginCountryCubit, UpdateShipmentOriginCountryState>(
          listener: (context, state) {
            if (state is UpdateShipmentOriginCountryFailure) {
              showSnackBar(context, 'فشل تحديث البلد المصدر: ${state.message}', Colors.red);
            }
            if (state is UpdateShipmentOriginCountrySuccess) {
              originSuccess = true;
              checkAndCloseIfDone();
            }
          },
        ),
        BlocListener<UpdateShipmentDestenationCountryCubit, UpdateShipmentDestenationCountryState>(
          listener: (context, state) {
            if (state is UpdateShipmentDestenationCountryFailure) {
              showSnackBar(context, 'فشل تحديث البلد الوجهة: ${state.message}', Colors.red);
            }
            if (state is UpdateShipmentDestenationCountrySuccess) {
              destinationSuccess = true;
              checkAndCloseIfDone();
            }
          },
        ),
      ],
      child: Container(
        width: 200.w,
        height: 500.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.lightGray2,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('البلد الوجهة', style: Styles.textStyle5Sp.copyWith(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text(isDestinationUAE ? 'الإمارات 🇦🇪' : 'تركيا 🇹🇷', style: Styles.textStyle5Sp),
              value: isDestinationUAE,
              onChanged: (value) {
                setState(() {
                  isDestinationUAE = value;
                });
              },
              activeColor: AppColors.goldenYellow,
              contentPadding: EdgeInsets.zero,
            ),
            SizedBox(height: 20.h),

            Text('البلد المصدر', style: Styles.textStyle5Sp.copyWith(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text(isOriginUAE ? 'الإمارات 🇦🇪' : 'تركيا 🇹🇷', style: Styles.textStyle5Sp),
              value: isOriginUAE,
              onChanged: (value) {
                setState(() {
                  isOriginUAE = value;
                });
              },
              activeColor: AppColors.goldenYellow,
              contentPadding: EdgeInsets.zero,
            ),

            const Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    originSuccess = false;
                    destinationSuccess = false;
                  });

                  final originId = isOriginUAE ? 2 : 1;
                  final destinationId = isDestinationUAE ? 2 : 1;

                  context.read<UpdateShipmentOriginCountryCubit>().updateCountry(
                    idShipment: widget.idShipment,
                    idCountry: originId,
                  );

                  context.read<UpdateShipmentDestenationCountryCubit>().updateCountry(
                    idShipment: widget.idShipment,
                    idCountry: destinationId,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldenYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text('حفظ', style: Styles.textStyle5Sp.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warehouse_subul/core/helpers/assets_data.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/core/widgets/custom_ok_button.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/get_drivers_cubit/get_drivers_cubit.dart';
import 'package:warehouse_subul/features/warehouse_manager/ui/widgets/card_text_field.dart';

class UploadNumberImageAndNameOfDriverShipment extends StatefulWidget {
  const UploadNumberImageAndNameOfDriverShipment({super.key});

  @override
  State<UploadNumberImageAndNameOfDriverShipment> createState() => _UploadNumberImageAndNameOfDriverShipmentState();
}

class _UploadNumberImageAndNameOfDriverShipmentState extends State<UploadNumberImageAndNameOfDriverShipment> {
  String? selectedDriver;
  List<String> driverNames = ['أحمد محمد', 'خالد يوسف', 'سامي علي'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: 120.w,
        height: 600.h,
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.lightGray2,
          borderRadius: BorderRadius.circular(cornerRadius),
          border: Border.all(width: 1, color: AppColors.goldenYellow),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardTextField(
              svgPicture: SvgPicture.asset(AssetsData.outlinePurpleBox),
              hintText: 'عدد الطرود',
            ),
            SizedBox(height: size.height / 25),
            BlocBuilder<GetDriversCubit, GetDriversState>(
  builder: (context, state) {
    if (state is GetDriversLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is GetDriversFailure) {
      return Text('فشل في تحميل السائقين: ${state.message}');
    } else if (state is GetDriversSuccess) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedDriver,
            isDense: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: SvgPicture.asset(AssetsData.personName,),
            ),
            hint: Text(
              'اسم السائق',
              style: Styles.textStyle5Sp.copyWith(color: Colors.grey,overflow: TextOverflow.ellipsis,),
            ),
            items: state.drivers.map((driver) {
              return DropdownMenuItem<String>(
                value: driver.nameDriver, // أو id حسب ما تحتاج
                child: Text(driver.nameDriver, style: Styles.textStyle4Sp,maxLines: 1,overflow: TextOverflow.ellipsis,),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedDriver = value;
              });
            },
          ),
        ),
      );
    } else {
      return const SizedBox(); // في حالة initial
    }
  },
),

            SizedBox(height: size.height / 20),
            Container(
              width: 65.w,
              height: 120.h,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    // spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'ارفع صورة الشحنة',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Styles.textStyle4Sp,
                    ),
                  ),
                  Flexible(
                    child: Icon(
                      Icons.camera_enhance_outlined,
                      color: AppColors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height / 20),
            CustomOkButton(
              onTap: () {},
              color: AppColors.goldenYellow,
              label: 'موافق',
            ),
          ],
        ),
      ),
    );
  }
}

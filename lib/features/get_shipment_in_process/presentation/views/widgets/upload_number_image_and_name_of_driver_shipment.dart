import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warehouse_subul/core/helpers/assets_data.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/core/utils/functions/show_snack_bar.dart';
import 'package:warehouse_subul/core/widgets/custom_ok_button.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/get_drivers_cubit/get_drivers_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/update_shipment_for_delivery_cubit/update_shipment_for_delivery_cubit.dart';
import 'package:warehouse_subul/features/warehouse_manager/ui/widgets/card_text_field.dart';

class UploadNumberImageAndNameOfDriverShipment extends StatefulWidget {
  final int shipmentId;
  const UploadNumberImageAndNameOfDriverShipment({super.key, required this.shipmentId});

  @override
  State<UploadNumberImageAndNameOfDriverShipment> createState() =>
      _UploadNumberImageAndNameOfDriverShipmentState();
}

class _UploadNumberImageAndNameOfDriverShipmentState
    extends State<UploadNumberImageAndNameOfDriverShipment> {
 
  int? selectedIdDelivery;

  XFile? pickedImage;
  Uint8List? imageBytes;
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        pickedImage = image;
        imageBytes = bytes;
      });
    }
  }

  final TextEditingController countOfParcels = TextEditingController();

  @override
  void dispose() {
    countOfParcels.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BlocConsumer<
        UpdateShipmentForDeliveryCubit,
        UpdateShipmentForDeliveryState
      >(
        listener: (context, state) {
          if (state is UpdateShipmentForDeliveryFailure) {
    showSnackBar(context, state.message, Colors.red);
  } else if (state is UpdateShipmentForDeliverySuccess) {
    showSnackBar(context, 'تم تحديث الشحنة بنجاح', Colors.green);
    Navigator.pop(context); 
  }
        },
        builder: (context, state) {
          return Container(
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
                  controller: countOfParcels,
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
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<int>(
                            value: selectedIdDelivery,
                            isDense: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: SvgPicture.asset(AssetsData.personName),
                            ),
                            hint: Text(
                              'اسم السائق',
                              style: Styles.textStyle5Sp.copyWith(
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            items:
                                state.drivers.map((driver) {
                                  return DropdownMenuItem<int>(
                                    value: driver.idDriver,
                                    child: Text(
                                      driver.nameDriver,
                                      style: Styles.textStyle4Sp,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedIdDelivery = value;
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
                InkWell(
                  onTap: pickImage,
                  child: Container(
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
                    child:
                        imageBytes != null
                            ? Image.memory(imageBytes!, fit: BoxFit.cover)
                            : Row(
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
                ),
                SizedBox(height: size.height / 20),
                CustomOkButton(
                  onTap: () {
                    if (countOfParcels.text.isEmpty) {
                      showSnackBar(context, "أدخل عدد الطرود", Colors.red);
                      return;
                    }
                    if (pickedImage == null) {
                      showSnackBar(context, "أرفع صورة الشحنة", Colors.red);
                      return;
                    }
                    if (selectedIdDelivery == null) {
                      showSnackBar(context, "اختر السائق", Colors.red);
                      return;
                    }
                    context.read<UpdateShipmentForDeliveryCubit>().updateShipment(
                      photo: pickedImage!,
                      idDelivery: selectedIdDelivery!,
                      actualParcelsCount: int.parse(countOfParcels.text),
                      idShipment:
                          widget.shipmentId, 
                    );
                  },
                  color: AppColors.goldenYellow,
                  label: 'موافق',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';

class CustomParcelOfInTheWayShipments extends StatelessWidget {
  final int id;
  final int shipmentId;
  final String actualWeight;
  final String specialActualWeight;
  final String normalActualWeight;
  final String? specialDimensionalWeight;
  final String? normalDimensionalWeight;
  final String length;
  final String width;
  final String height;
  final String calculatedDimensionalWeight;
  final String calculatedFinalWeight;
  final int customerId;
  final String firstName;
  final String lastName;
  const CustomParcelOfInTheWayShipments({
    super.key,
    required this.id,
    required this.shipmentId,
    required this.actualWeight,
    required this.specialActualWeight,
    required this.normalActualWeight,
    this.specialDimensionalWeight,
    this.normalDimensionalWeight,
    required this.length,
    required this.width,
    required this.height,
    required this.calculatedDimensionalWeight,
    required this.calculatedFinalWeight,
    required this.customerId,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: AppColors.lightGray2,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              width,
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              length,
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 20.w,
            child: Text(
              height,
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              normalDimensionalWeight.toString(),
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              specialDimensionalWeight.toString(),
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              normalActualWeight,
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              specialActualWeight,
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              actualWeight,
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // SizedBox(
          //   width: 40.w,
          //   child: Text(
          //     '7575757577',
          //     textAlign: TextAlign.center,
          //     style: Styles.textStyle5Sp,
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
          SizedBox(
            width: 40.w,
            child: Text(
              '$firstName $lastName',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          PopupMenuButton<String>(
        icon: Icon(Icons.more_vert, color: AppColors.black),
        onSelected: (value) {
          if (value == 'view') {
         //  context.pushNamed(Routes.showParcelItemsScreen,arguments: id);
          } else if (value == 'create') {
          //  context.pushNamed(Routes.createParcelItemScreen, arguments: id);
          }
        },
        itemBuilder: (context) => [
          // PopupMenuItem(
          //   value: 'view',
          //   child: Text('عرض عناصر الطرد'),
          // ),
          // PopupMenuItem(
          //   value: 'create',
          //   child: Text('إنشاء عناصر للطرد'),
          // ),
        ],
      ),
        ],
      ),
    );
  }
}

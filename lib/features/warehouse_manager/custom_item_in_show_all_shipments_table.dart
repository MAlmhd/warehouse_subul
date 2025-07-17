import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/shipment_in_process_entity/shipment_in_process_entity.dart';

class CustomItemInShowAllShipmentsTable extends StatelessWidget {
 
  const CustomItemInShowAllShipmentsTable({super.key,});

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
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '7575757577',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 40.w,
            child: Text(
              '4',
              textAlign: TextAlign.center,
              style: Styles.textStyle5Sp,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

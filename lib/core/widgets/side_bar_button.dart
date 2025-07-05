import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';

class SideBarButton extends StatelessWidget {
  const SideBarButton({super.key, required this.onTap, required this.text, required this.isSelected});
  final void Function() onTap;
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 65.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.deepPurple : AppColors.goldenYellow,
            borderRadius: BorderRadius.circular(cornerRadius),
          ),
          child: Center(// 5 white : black
            child: Text(
              text,
              style: Styles.textStyle5Sp.copyWith(color:  isSelected ? AppColors.white : AppColors.black)
            ),
          ),
        ),
      ),
    );
  }
}

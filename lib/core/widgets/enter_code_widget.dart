import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/helpers/constants.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';

class EnterCodeWidget extends StatelessWidget {
  const EnterCodeWidget({super.key, required this.label, required this.onTap});
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 110.w,
      height: 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: AppColors.goldenYellow,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: size.height / 20),
            Text(
              label,
              style: Styles.textStyle5Sp
            ),
            SizedBox(height: size.height / 40),
            Stack(
              clipBehavior: Clip.none,
              children: [
                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                Positioned(
                  top: 35.h,
                  child: Dash(
                    length: 85.w,
                    dashColor: Colors.black,
                    dashLength: 2,
                    dashGap: 3,
                    dashThickness: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'أنشئ واحد',
                      style: Styles.textStyle3Sp.copyWith(color: AppColors.deepPurple,),
                    ),
                  ),
                ),
                Text(
                  '     ليس لديك رمز؟',
                  style: Styles.textStyle3Sp
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

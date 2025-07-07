import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/helpers/assets_data.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/core/utils/service_locator.dart';
import 'package:warehouse_subul/core/widgets/custom_icon_of_side_bar.dart';
import 'package:warehouse_subul/core/widgets/text_logo.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/create_shipment_use_case/create_shipment_use_case.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/get_countries_use_case/get_countries_use_case.dart';
import 'package:warehouse_subul/features/create_shipment/domain/use_case/get_users_use_case/get_user_use_case.dart';
import 'package:warehouse_subul/features/create_shipment/presentation/manager/create_shipment_cubit/create_shipment_cubit.dart';
import 'package:warehouse_subul/features/create_shipment/presentation/manager/get_countries_cubit/get_countries_cubit.dart';
import 'package:warehouse_subul/features/create_shipment/presentation/manager/get_users_cubit/get_users_cubit.dart';
import 'package:warehouse_subul/features/create_shipment/presentation/views/add_shipment_form.dart';

class WarehouseManager extends StatefulWidget {
  const WarehouseManager({super.key});

  @override
  State<WarehouseManager> createState() => _WarehouseManagerState();
}

class _WarehouseManagerState extends State<WarehouseManager> {
  int selectedButtonIndex = 0;
  void onButtonTap(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.grey, AppColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 40.h),
                        child: TextLogo(),
                      ),
                      SizedBox(height: size.height / 10),
                      Container(
                        width: 20.w,
                        height: 900.h,
                        decoration: BoxDecoration(
                          color: AppColors.goldenYellow,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(120),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconOfSideBar(
                              icon: Icons.add,
                              color: AppColors.white,
                              onTap: () {},
                              isSelected: selectedButtonIndex == 0,
                            ),
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              icon: Icons.local_shipping,
                              color: AppColors.white,
                              onTap: () {},
                              isSelected: false,
                            ),
                            SizedBox(height: size.height / 10),
                            CustomIconOfSideBar(
                              image: AssetsData.boxShipmmentIcon,
                              onTap: () {},
                              isSelected: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: selectedButtonIndex,
                  children: [
                    MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create:
                              (context) =>
                                  GetUsersCubit(sl.get<GetUserUseCase>()),
                        ),
                        BlocProvider(create: (context) => GetCountriesCubit(sl.get<GetCountriesUseCase>())),
                        BlocProvider(create: (context) => CreateShipmentCubit(sl.get<CreateShipmentUseCase>())),
                      ],
                      child: AddShipmentForm(),
                    ),
                    // EditReceivingShipmentsTable(
                    //   widget: CustomOkButton(
                    //     onTap: () {},
                    //     color: AppColors.goldenYellow,
                    //     label: 'تعديل',
                    //   ),
                    // ),
                    // EditShippingDetail(),
                    //  LogisticsEntryScreen(),
                    // SubulReceiptScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

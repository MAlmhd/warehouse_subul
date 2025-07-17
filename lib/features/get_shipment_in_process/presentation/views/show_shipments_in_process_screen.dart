import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:warehouse_subul/core/utils/functions/show_snack_bar.dart';
import 'package:warehouse_subul/core/widgets/custom_progress_indicator.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/manager/get_shipments_in_process_cubit/get_shipment_in_proccess_cubit.dart';
import 'package:warehouse_subul/features/get_shipment_in_process/presentation/views/widgets/shipments_info_card.dart';

class ShowShipmentsInProcessScreen extends StatelessWidget {
  const ShowShipmentsInProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    


    return SafeArea(
      child:
          BlocConsumer<GetShipmentInProccessCubit, GetShipmentInProccessState>(
            listener: (context, state) {
              if (state is GetShipmentInProccessFailure) {
                showSnackBar(context, state.message, Colors.red);
              }
            },
            builder: (context, state) {
              if (state is GetShipmentInProccessLoading) {
                return const CustomProgressIndicator();
              } else if (state is GetShipmentInProccessSuccess) {
                return Padding(
                  padding:  EdgeInsets.only(top: 200.h,right: 30.w),
                  child: SizedBox(
                    height: 800.h,
                    width: 500.w,
                    child: ListView.builder(
                      itemCount: state.shipments.length,
                      itemBuilder:
                          (context, index) => ShipmentInfoCard(
                            shipment: state.shipments[index],
                          ),
                    ),
                  ),
                );
              } else {
                return const Center(child: Text("لا توجد بيانات حالياً"));
              }
            },
          ),
    );
  }
}

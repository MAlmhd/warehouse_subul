import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:warehouse_subul/core/helpers/assets_data.dart';
import 'package:warehouse_subul/core/helpers/styles.dart';
import 'package:warehouse_subul/core/theming/app_colors.dart';
import 'package:warehouse_subul/features/create_shipment/domain/entities/country_entity/country_entity.dart';

import 'package:warehouse_subul/features/create_shipment/domain/entities/user_entity/user_entity.dart';
import 'package:warehouse_subul/features/create_shipment/presentation/manager/get_countries_cubit/get_countries_cubit.dart';
import 'package:warehouse_subul/features/create_shipment/presentation/manager/get_users_cubit/get_users_cubit.dart';
import 'package:warehouse_subul/features/warehouse_manager/ui/widgets/custom_input_field.dart';

import 'package:warehouse_subul/features/warehouse_manager/ui/widgets/tracking_number_card.dart';

class AddShipmentForm extends StatefulWidget {
  const AddShipmentForm({super.key});

  @override
  State<AddShipmentForm> createState() => _AddShipmentFormState();
}

class _AddShipmentFormState extends State<AddShipmentForm> {
  UserEntity? selectedCustomer;
  CountryEntity? selectedOriginCountry;
  CountryEntity? selectedDestinitionCountry;
  List<CountryEntity> countries = [];
  List<String> typeOfShipments = ['ship_pay', 'ship_only', 'pay_only'];
  String? selectedType;

  @override
  void initState() {
    super.initState();
    context.read<GetUsersCubit>().getUser();
    context.read<GetCountriesCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(child: SvgPicture.asset(AssetsData.ballon, width: 80.w)),
          ],
        ),
        SizedBox(height: size.height / 20),

        BlocBuilder<GetUsersCubit, GetUsersState>(
          builder: (context, state) {
            List<UserEntity> users = [];
            if (state is GetUsersSuccess) {
              users = state.users;
            }

            return GenericDropdownField<UserEntity>(
              items: users,
              selectedItem: selectedCustomer,
              onChanged: (value) {
                setState(() => selectedCustomer = value);
              },
              itemAsString: (c) => c.firstName,
              hintText: 'اسم العميل',
              svgIcon: SvgPicture.asset(AssetsData.person, height: 20.h),
            );
          },
        ),

        SizedBox(height: size.height / 20),

        BlocBuilder<GetCountriesCubit, GetCountriesState>(
          builder: (context, state) {
            if (state is GetCountriesSuccess) {
              countries = state.countries;
            }

            return GenericDropdownField<CountryEntity>(
              items: countries,
              selectedItem: selectedOriginCountry,
              onChanged: (value) {
                setState(() => selectedOriginCountry = value);
              },
              itemAsString: (c) => c.name,
              hintText: 'البلد المصدر',
              svgIcon: SvgPicture.asset(AssetsData.bulb, height: 20.h),
            );
          },
        ),

        SizedBox(height: size.height / 20),
        GenericDropdownField<CountryEntity>(
          items: countries,
          selectedItem: selectedDestinitionCountry,
          onChanged: (value) {
            setState(() => selectedDestinitionCountry = value);
          },
          itemAsString: (c) => c.name,
          hintText: 'البلد الوجهة',
          svgIcon: SvgPicture.asset(AssetsData.bulb, height: 20.h),
        ),
        SizedBox(height: size.height / 20),

        GenericDropdownField<String>(
          items: typeOfShipments,
          selectedItem: selectedType,
          onChanged: (value) {
            setState(() => selectedType = value);
          },
          itemAsString: (c) => c,
          hintText: 'نوع الشحنة',
          svgIcon: SvgPicture.asset(AssetsData.outlinePurpleBox, height: 20.h),
        ),
        SizedBox(height: size.height / 20),

        Container(
          width: 50.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.goldenYellow,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.deepGray),
          ),
          child: Center(
            child: Text(
              'موافق',
              style: Styles.textStyle4Sp.copyWith(
                color: AppColors.black.withValues(alpha: 0.4),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height / 20),
        const TrackNumberCard(number: '8428004'),
      ],
    );
  }
}

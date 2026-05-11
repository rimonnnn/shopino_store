import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:ecommerce_app/features/address_screen/widgets/custom_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Address", style: AppStyles.black32SemiBold),
        centerTitle: true,
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeightSpace(10),
              Divider(color: AppColors.secondaryColor, thickness: 1),
              HeightSpace(20),
              Text("Saved Address", style: AppStyles.black16SemiBold),
              HeightSpace(20),
              CustomAddressWidget(
                addressName: "Home",
                addressDetails: "925 S Chugach St #APT 10, Alas...",
              ),
              HeightSpace(20),
              CustomAddressWidget(
                addressName: "Office",
                addressDetails: "925 S Chugach St #APT 10, Alas...",
              ),
              HeightSpace(20),
              CustomAddressWidget(
                addressName: "Apartment",
                addressDetails: "925 S Chugach St #APT 10, Alas...",
              ),
              HeightSpace(20),
              CustomAddressWidget(
                addressName: "Parent’s House",
                addressDetails: "925 S Chugach St #APT 10, Alas...",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

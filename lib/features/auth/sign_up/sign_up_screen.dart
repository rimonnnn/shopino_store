import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_text_field.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeightSpace(55),
                Text("Create an account", style: AppStyles.black32SemiBold),
                HeightSpace(8),
                Text("Let’s create your account.", style: AppStyles.grey16W400),
                HeightSpace(24),
                Text("Full Name", style: AppStyles.black16SemiBold),
                HeightSpace(4),
                PrimaryTextField(hintText: "Enter your full name"),
                HeightSpace(16),
                Text("User Email", style: AppStyles.black16SemiBold),
                HeightSpace(4),
                PrimaryTextField(hintText: "Enter your email address"),
                HeightSpace(16),
                Text("Password", style: AppStyles.black16SemiBold),
                HeightSpace(4),
                PrimaryTextField(
                  hintText: "Enter your password",
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.secondaryColor,
                  ),
                ),
                HeightSpace(42),
                Text("Confirm Password", style: AppStyles.black16SemiBold),
                HeightSpace(4),
                PrimaryTextField(
                  hintText: "Enter your password",
                  suffixIcon: Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.secondaryColor,
                  ),
                ),
                HeightSpace(42),
                Align(
                  alignment: Alignment.center,
                  child: PrimaryButtonWidget(
                    buttonText: "Create Account",
                    onPress: () {},
                  ),
                ),
                HeightSpace(150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppStyles.grey16W400,
                    ),
                    WidthSpace(8),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
                      },
                      child: Text("Log In", style: AppStyles.black16SemiBold),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

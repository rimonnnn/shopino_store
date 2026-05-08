import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_text_field.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Text("Login to your account", style: AppStyles.black32SemiBold),
                HeightSpace(8),
                Text(
                  "It’s great to see you again.",
                  style: AppStyles.grey16W400,
                ),
                HeightSpace(24),
                Text("User Name", style: AppStyles.black16SemiBold),
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
                HeightSpace(55),
                Align(
                  alignment: Alignment.center,
                  child: PrimaryButtonWidget(
                    buttonText: "Sign in",
                    onPress: () {},
                  ),
                ),
                HeightSpace(363),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?", style: AppStyles.grey16W400),
                    WidthSpace(8),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(AppRoutes.signUpScreen);
                      },
                      child: Text("Join", style: AppStyles.black16SemiBold),
                    ),
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

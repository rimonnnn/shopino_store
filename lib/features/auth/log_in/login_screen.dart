import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_text_field.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeightSpace(55),
                  Text(
                    "Login to your account",
                    style: AppStyles.black32SemiBold,
                  ),
                  HeightSpace(8),
                  Text(
                    "It’s great to see you again.",
                    style: AppStyles.grey16W400,
                  ),
                  HeightSpace(24),
                  Text("Email address", style: AppStyles.black16SemiBold),
                  HeightSpace(4),
                  PrimaryTextField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter your email";
                      }

                      final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

                      if (!emailRegex.hasMatch(value.trim())) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                    controller: emailController,
                    hintText: "Enter your email address",
                  ),
                  HeightSpace(16),
                  Text("Password", style: AppStyles.black16SemiBold),
                  HeightSpace(4),
                  PrimaryTextField(
                    isPassword: isPasswordHidden,

                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password";
                      } else if (value.length < 9) {
                        return "Enter at least 9 numbers";
                      }
                      return null;
                    },
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: isPasswordHidden
                          ? Icon(
                              Icons.visibility_off,
                              color: AppColors.secondaryColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: AppColors.secondaryColor,
                            ),
                    ),
                  ),
                  HeightSpace(55),
                  Align(
                    alignment: Alignment.center,
                    child: PrimaryButtonWidget(
                      buttonText: "Sign in",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          debugPrint("Email: ${emailController.text}");
                          debugPrint("Password: ${passwordController.text}");

                          GoRouter.of(context).pushNamed(AppRoutes.mainScreen);
                        }
                      },
                    ),
                  ),
                  HeightSpace(340),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: AppStyles.grey16W400,
                      ),
                      WidthSpace(8),
                      InkWell(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRoutes.signUpScreen);
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
      ),
    );
  }
}

import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_text_field.dart';
import 'package:ecommerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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

                  Text("Create an account", style: AppStyles.black32SemiBold),

                  HeightSpace(8),

                  Text(
                    "Let’s create your account.",
                    style: AppStyles.grey16W400,
                  ),

                  HeightSpace(24),

                  Text("Full Name", style: AppStyles.black16SemiBold),

                  HeightSpace(4),

                  PrimaryTextField(
                    controller: fullNameController,
                    hintText: "Enter your full name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter your full name";
                      } else if (value.trim().length < 3) {
                        return "Please enter your real name";
                      }
                      return null;
                    },
                  ),

                  HeightSpace(16),

                  Text("Email address", style: AppStyles.black16SemiBold),

                  HeightSpace(4),

                  PrimaryTextField(
                    controller: emailController,
                    hintText: "Enter your email address",
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
                  ),

                  HeightSpace(16),

                  Text("Password", style: AppStyles.black16SemiBold),

                  HeightSpace(4),

                  PrimaryTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    isPassword: isPasswordHidden,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter your password";
                      } else if (value.trim().length < 8) {
                        return "Password must be at least 8 characters";
                      }

                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),

                  HeightSpace(42),

                  Text("Confirm Password", style: AppStyles.black16SemiBold),

                  HeightSpace(4),

                  PrimaryTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm your password",
                    isPassword: isConfirmPasswordHidden,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Confirm your password";
                      } else if (value.trim() !=
                          passwordController.text.trim()) {
                        return "Passwords do not match";
                      }

                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordHidden = !isConfirmPasswordHidden;
                        });
                      },
                      icon: Icon(
                        isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),

                  HeightSpace(42),

                  Align(
                    alignment: Alignment.center,
                    child: PrimaryButtonWidget(
                      buttonText: "Create Account",
                      // جوه onPress بتاع PrimaryButtonWidget "Create Account"
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          debugPrint(
                            "Full Name: ${fullNameController.text.trim()}",
                          );
                          debugPrint("Email: ${emailController.text.trim()}");
                          debugPrint(
                            "Password: ${passwordController.text.trim()}",
                          );

                          GoRouter.of(context).goNamed(AppRoutes.loginScreen);
                        }
                      },
                    ),
                  ),

                  HeightSpace(120),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppStyles.grey16W400,
                      ),

                      WidthSpace(8),

                      // جوه InkWell "Log In" في الآخر
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).goNamed(AppRoutes.loginScreen);
                        },
                        child: Text("Log In", style: AppStyles.black16SemiBold),
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

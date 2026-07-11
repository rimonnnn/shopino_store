import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("My Orders", style: AppStyles.black32SemiBold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("No orders found ...", style: AppStyles.grey16W400),
          ),
        ],
      ),
    );
  }
}

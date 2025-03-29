import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/main_view.dart';
import 'package:flutter/material.dart';

void main() async {
  await getItSetup();
  runApp(const EcommerceApp());
}

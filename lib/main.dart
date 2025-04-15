import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/helpers/custom_bloc_observer.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/main_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getItSetup();
  Bloc.observer = CustomBlocObserver();
  // runApp(
  //   const EcommerceApp(),
  // );
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const EcommerceApp(),
  ));
}

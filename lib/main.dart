import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_app/cubit/home_cubit.dart';
import 'package:recipes_app/responsive_helper/size_provider.dart';
import 'package:recipes_app/responsive_helper/sizer_helper.dart';
import 'package:recipes_app/views/home.dart';
import 'package:recipes_app/repos/api_helper.dart';
import 'package:recipes_app/repos/home_repo_imple.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        HomeRepoImpl(
          ApiHelper(Dio()),
        ),
      )..getAllRecipes(),
      child: SizeProvider(
        baseSize: const Size(360, 690),
        width: context.screenWidth,
        height: context.screenHeight,
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ),
      ),
    );
  }
}

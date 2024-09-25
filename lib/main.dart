import 'package:apinew/api/api_listhome.dart';
import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/bloc/search_cubit.dart';
import 'package:apinew/model/home_page.dart';
import 'package:apinew/ui/Home_page.dart';
import 'package:apinew/widget/YouToBe.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
builder: (context, child)=> MultiBlocProvider(
    providers: [
      BlocProvider<SearchCubit>(
        create: (context) =>
            SearchCubit(data1 : Data(Dio())),
      ),

    ],
  child:  MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: HomePage( ),
  ),
),
    );
  }
}

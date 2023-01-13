import 'package:api_app/bloc/cubit.dart';
import 'package:api_app/bloc/state.dart';
import 'package:api_app/network/local/cashmemory.dart';
import 'package:api_app/network/rempte/dio.dart';
import 'package:api_app/screens/homescreen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  var ismodedark = CashHelper.getbooldata(key: "isdark");
  if (ismodedark == null) {
    CashHelper.setbooldata(key: "isdark", value: false);
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
      create: (context) => NewsCubit(),),
    ],
  
      child: BlocConsumer<NewsCubit, NewsState>(
        builder: (BuildContext context, state) {
          NewsCubit obj = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            darkTheme: ThemeData(
                textTheme: TextTheme(
                    titleLarge: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent)),
                primarySwatch: Colors.lightBlue,
                scaffoldBackgroundColor: Colors.black,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    elevation: 30,
                    unselectedItemColor: Colors.white,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.lightBlue),
                appBarTheme: const AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.white),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.light,
                        statusBarColor: Colors.black,
                        statusBarBrightness: Brightness.light),
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.black)),
            theme: ThemeData(
                textTheme: TextTheme(
                  
                    titleLarge: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueAccent)),
                primarySwatch: Colors.cyan,
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    elevation: 30,
                    unselectedItemColor: Colors.black,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.cyan),
                appBarTheme: const AppBarTheme(
                    actionsIconTheme: IconThemeData(color: Colors.black),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white,
                        systemNavigationBarDividerColor: Colors.black,
                        systemNavigationBarColor: Colors.black,
                        statusBarBrightness: Brightness.dark),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white)),
            themeMode:
                NewsCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeApp(),
          );
        },
        listener: (context, state) {},
      ),
    ),
  );
}

import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/admin.dart';
import 'package:grinta/cache_helper.dart';
import 'package:grinta/component.dart';
import 'package:grinta/cubit.dart';
import 'package:grinta/dio_helper.dart';
import 'package:grinta/home.dart';
import 'package:grinta/login/login_screen.dart';
import 'package:grinta/screens/account_Screen.dart';
import 'package:grinta/screens/feeds.dart';
import 'package:grinta/screens/setting_screen.dart';
import 'package:grinta/state.dart';


Widget widget;

void main() async{

  BuildContext context;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dioHelper.init();


  await CacheHelper.init();




  UID = CacheHelper.getData(key: 'uId');

  if (UID != null){
    widget = home();
  }

  else{
    widget = login();
  }


  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getUser(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
        builder: (BuildContext context , AppState state){
          return MaterialApp(
            home: widget,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}


import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/Cart_model.dart';
import 'package:grinta/component.dart';
import 'package:grinta/dio_helper.dart';
import 'package:grinta/home.dart';
import 'package:grinta/register/Registeration_model.dart';
import 'package:grinta/screens/account_Screen.dart';
import 'package:grinta/screens/cart_screen.dart';
import 'package:grinta/screens/feeds.dart';
import 'package:grinta/screens/setting_screen.dart';
import 'package:grinta/state.dart';

class AppCubit extends Cubit<AppState>{

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) =>BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> screens = [
    feeds(),
    cart(),
    account(),
    setting(),
  ];

  List<String> title = [
    'StoreRoom',
    'Cart',
    'Account',
    'Setting',
  ];

  void onItemTapped(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }



  List<dynamic>medicine = [];

  void getMedicine(){
    emit(GetProductsLoadingState());
    dioHelper.getData(
        url: 'medicine',
    ).then((value){
      medicine =value.data;
      emit(GetProductsSuccessState());
    }).catchError((error){
      emit(GetProductsErrorState());
    });

  }


  void getUser(){
    emit(AppInitialState());
    FirebaseFirestore.instance.collection('user').doc(UID).get()
        .then((value){
      model = RegisterModel.fromJson(value.data());
      emit(AppSuccessState());
    }).catchError((error){
      emit(AppErrorState());
    });
  }


  void setCartData({
    String name,
    String price,
    String image,
  }){
    CartModel cartModel = CartModel(
      productName: name,
      productPrice: price,
      productImage : image,
    );

    emit(CartDataCreated());
    print('data created');
    FirebaseFirestore.instance.collection('user').doc(UID).collection('carts')
        .add(cartModel.toMap()).then((value){
          totalPrice += int.parse(cartModel.productPrice);
          print(totalPrice);
          getCartData();
    });


  }

  void getCartData(){
    FirebaseFirestore.instance.collection('user').doc(UID).collection('carts')
        .get().then((value){
      carts = [];
      value.docs.forEach((element){
        cartModel = CartModel.fromJson(element.data());
        carts.add(CartModel.fromJson(element.data()));
      });
    }).catchError((error){
      print(error.toString());
    });
  }

}

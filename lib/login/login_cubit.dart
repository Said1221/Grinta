
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/component.dart';
import 'package:grinta/home.dart';
import 'package:grinta/login/login_state.dart';



class LoginCubit extends Cubit<LoginState>{

  LoginCubit(): super (LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  void userLogin({
     String email,
     String password
  })
  {
    emit(LoginInitialState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
        .then((value){
      print('success');
      emit(LoginSuccessState(value.user.uid));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState());
    });
  }



}

import 'package:flutter/material.dart';

class LoginState{}

class LoginInitialState extends LoginState{}

class LoginSuccessState extends LoginState{

  final String uId;
  LoginSuccessState(this.uId);

}

class LoginErrorState extends LoginState{}




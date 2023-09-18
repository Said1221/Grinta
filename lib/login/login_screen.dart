
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grinta/cache_helper.dart';
import 'package:grinta/component.dart';
import 'package:grinta/cubit.dart';
import 'package:grinta/home.dart';
import 'package:grinta/login/login_cubit.dart';
import 'package:grinta/login/login_state.dart';
import 'package:grinta/register/register_screen.dart';
import 'package:grinta/screens/feeds.dart';



class login extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginState>(
      listener: (BuildContext context , LoginState state){

        if(state is LoginSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            UID = CacheHelper.getData(key: 'uId');

            Fluttertoast.showToast(
              msg: 'Login Success',
              timeInSecForIosWeb: 3,
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_LONG,
              fontSize: 16,
              backgroundColor: Colors.green,
            );
          });
          navigateTo(context, home());
        }


        if(state is LoginErrorState){
          Fluttertoast.showToast(
            msg: 'Invalid User',
            timeInSecForIosWeb: 3,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 16,
            backgroundColor: Colors.red,
          );
        }


      },
      builder: (BuildContext context , LoginState state){
        LoginCubit cubit = LoginCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login Screen',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            label: Text('Email Address'),
                            prefixIcon:Icon(
                              Icons.email,
                            )
                        ),
                      ),


                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            label: Text('Password'),
                            prefixIcon: Icon(
                              Icons.lock,
                            )
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Container(
                        width: double.infinity,
                        child: MaterialButton(onPressed: (){
                          cubit.userLogin(
                            email: emailController.text ,
                            password: passwordController.text,
                          );
                        },
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.blue,
                          child: Text('Login',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: TextButton(onPressed: (){
                          navigateTo(context, registeration());
                        },
                          child: Text('Create an account',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}

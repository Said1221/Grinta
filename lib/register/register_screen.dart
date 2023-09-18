
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grinta/cache_helper.dart';
import 'package:grinta/component.dart';
import 'package:grinta/login/login_screen.dart';
import 'package:grinta/register/register_cubit.dart';
import 'package:grinta/register/register_state.dart';


class registeration extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var govController = TextEditingController();
  var pharmacyNameController = TextEditingController();
  var pharmacyAddressController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {


    return BlocProvider(create: (BuildContext context)=>RegCubit(),
        child: BlocConsumer<RegCubit , RegState>(
          listener: (BuildContext context , RegState state){

            if(state is RegCreateUserSuccessState){
              Fluttertoast.showToast(
                msg: 'Register Success',
                timeInSecForIosWeb: 3,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
                fontSize: 16,
                backgroundColor: Colors.green,
              );

              navigateTo(context, login());
            }
             if(state is RegErrorState){
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


      builder: (BuildContext context , RegState state){
        RegCubit cubit = RegCubit.get(context);
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
                        'Create an account',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Form(
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value){
                            if(value == null){
                              return 'please enter your name';
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: Text('Name'),
                              prefixIcon:Icon(
                                Icons.person,
                              )
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text('Email Address'),
                            prefixIcon: Icon(
                              Icons.email,
                            )
                        ),
                      ),


                      SizedBox(
                        height: 10,
                      ),


                      TextFormField(
                        controller: govController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text('Governorate'),
                            prefixIcon:Icon(
                              Icons.location_city,
                            )
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        controller: pharmacyNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text('Pharmacy Name'),
                            prefixIcon:Icon(
                              Icons.local_pharmacy,
                            )
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        controller: pharmacyAddressController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Text('Pharmacy Address'),
                            prefixIcon:Icon(
                              Icons.location_pin,
                            )
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),


                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: Text('Phone Number'),
                                  prefixIcon:Icon(
                                    Icons.phone,
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: Text('Password'),
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      Container(
                        width: double.infinity,
                        child: MaterialButton(onPressed: (){
                          cubit.userReg(
                            name: nameController.text,
                            email: emailController.text,
                            gov: govController.text,
                            phone: phoneController.text,
                            phName: pharmacyNameController.text,
                            phAdd: pharmacyAddressController.text,
                            password: passwordController.text,
                          );

                          },


                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.blue,
                          child: Text('Register',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
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

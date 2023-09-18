import 'dart:ffi';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/Cart_model.dart';
import 'package:grinta/component.dart';
import 'package:grinta/cubit.dart';
import 'package:grinta/home.dart';
import 'package:grinta/state.dart';
import 'package:select_dialog/select_dialog.dart';


class cart extends StatefulWidget {

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext)=>AppCubit(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
        builder: (BuildContext context , AppState state){
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context , index)=>buildCartItems(carts[index] , context , index),
                    itemCount: carts.length,
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: Text("Total :  " + "${totalPrice}" + " EGP" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
                        MaterialButton(onPressed: (){
                        },
                          child: Text("Checkout" , style: TextStyle(color: Colors.white),),
                          color: Colors.yellow[900],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildCartItems(CartModel cartModel , context , index)=> Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Row(
                            children: [
                              Expanded(child: Image(
                                image: NetworkImage('${cartModel.productImage}'),)),

                              SizedBox(
                                width: 10,
                              ),

                              Expanded(
                                child: Column(
                                  children: [
                                    Text('${cartModel.productName}'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('${cartModel.productPrice}'),
                                  ],
                                ),
                              ),


                              IconButton(onPressed: ()=>setState(()=>totalPrice--),
                                icon: Icon(Icons.remove),
                              ),
                              Expanded(
                                  child: Center(child: Text("0" , style: TextStyle(fontSize: 15),))
                              ),

                              IconButton(onPressed: ()=>setState(()=>totalPrice++),
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.account_balance),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Interpharma Egycare"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(onPressed: (){},
                      icon: Icon(Icons.cancel , size: 20,)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}


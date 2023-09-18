
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/component.dart';

class account extends StatelessWidget {





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account details" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Pharmacy name" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                            SizedBox(height: 5,),
                            Text('${model.phName}'),

                            SizedBox(height: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Governorate" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                Text('${model.gov}'),

                              ],
                            ),

                            SizedBox(height: 10,),

                            Text("Pharmacy address" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                            SizedBox(height: 5,),
                            Text('${model.phAdd}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Divider(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                      Text("User details" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                  SizedBox(height: 5,),
                                  Text('${model.name}'),

                                  SizedBox(height: 10,),

                                     Text("Phone" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                     SizedBox(height: 5,),
                                     Text('${model.phone}'),

                                  SizedBox(height: 10,),

                                  Text("Email" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
                                  SizedBox(height: 5,),
                                  Text('${model.email}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

           MaterialButton(onPressed: (){} ,
             color: Colors.red,
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Icon(Icons.logout , color: Colors.white,),
                 Text("logout" , style: TextStyle(color: Colors.white),)
               ],
             ),
           ),
          ],
        ),
      )
    );

  }
}


import 'dart:ffi';

import 'package:flutter/material.dart';

class admin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add new product" , style: TextStyle(color: Colors.black),),
        leading: IconButton(
          color: Colors.black,
          onPressed: (){},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(onPressed: (){},
              child: Text("save" , style: TextStyle(color: Colors.green),),
          ),

          TextButton(onPressed: (){},
            child: Text("cancle" , style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(

            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Your Company : Semak For Cosmetics" , style: TextStyle(fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Address : امام مركز البحوث, 64 التحرير، الدقي، قسم الدقي" , style: TextStyle(fontSize: 15)),
              ),

              SizedBox(
                height: 15,
              ),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text("Product Name")
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Price")
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Stock")
                ),
                keyboardType: TextInputType.text,
              ),

              SizedBox(
                height: 30,
              ),

              TextButton(onPressed: (){
              },
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo),
                        SizedBox(width: 3,),
                        Text('add photo'),
                      ],
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

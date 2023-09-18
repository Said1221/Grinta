import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grinta/Cart_model.dart';
import 'package:grinta/admin.dart';
import 'package:grinta/cubit.dart';
import 'package:grinta/register/Registeration_model.dart';
import 'package:grinta/screens/account_Screen.dart';
import 'package:grinta/screens/cart_screen.dart';

List<CartModel>carts = [];
CartModel cartModel;
RegisterModel model;
int totalPrice = 0;
var UID;


Widget itemsBuilder(lists, context)=>ConditionalBuilder(
  condition: lists.length > 0,

  builder : (context)=>ListView.builder(
    itemBuilder: (context , index){
      return buildItems(lists[index] , context);
    },

    itemCount: lists.length,
  ),
  fallback: (context)=> Center(child: CircularProgressIndicator()),
);




Widget buildItems(list , context)=>InkWell(

  onTap: (){
    showItem(list, context);
    navigateTo(context, showItem(list, context));
  },
  child:   Card(

    elevation: 10,

    child: Padding(

      padding: const EdgeInsets.all(8.0),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Image(image: NetworkImage(list['image'])),

          myDivider(),

          Text(list['name'] , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),

          SizedBox(height: 10,),

          Row(
            children: [
              Text(list['price'] + " EGP", style: TextStyle(fontSize: 15)),
              SizedBox(
                width: 15,
              ),
              Text(list['old'] , style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 15 , color: Colors.red)),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10 , left: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(onPressed: (){
                    AppCubit().setCartData(
                      name: list['name'],
                      price: list['price'],
                      image:list['image'],
                    );
                    },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[900],

                    ),

                    icon: Icon(

                      Icons.shopping_cart,

                      size: 24.0,

                    ),

                    label: Text("Add to Cart"),

                  ),
                ),
                IconButton(onPressed: (){},
                    icon:Icon(Icons.favorite , color: Colors.red,),
                ),
                IconButton(onPressed: (){},
                  icon:Icon(Icons.share , color: Colors.blue,),
                )
              ],
            ),
          ),

        ],

      ),

    ),

  ),
);






Widget showItem(list , context)=>SafeArea(

  child:Scaffold(

    body: SingleChildScrollView(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Image(image: NetworkImage(list['image'])),

          SizedBox(

            height: 10,

          ),

          Padding(

            padding: const EdgeInsets.all(8.0),

            child: Row(

              children: [

                Expanded(child: Text(list['name'] , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15))),

                Column(

                  children: [

                    Text(list['price'] , style: TextStyle(fontSize: 15)),

                    Text(list['old'] , style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 15 , color: Colors.red)),

                  ],

                ),

              ],

            ),

          ),

          SizedBox(

            height: 10,

          ),



          Padding(

            padding: const EdgeInsets.all(8.0),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text("Interpharma Egycare" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15)),


                SizedBox(

                  height: 5,

                ),

                Row(

                  children: [

                    Expanded(child: Text("Behind Oriental Weavers, 2B Suleiman Al-Tamawy Street, Apartment 2, Ground Floor" , style: TextStyle(color: Colors.grey),)),

                    CircleAvatar(

                      backgroundColor: Colors.yellow[900],

                      child: IconButton(onPressed: (){},

                          icon: Icon(Icons.shopping_cart, color: Colors.white,)

                      ),

                    ),

                  ],

                ),

                SizedBox(
                  height: 5,
                ),
                Text("Stock : 2340 pieces" , style: TextStyle(color: Colors.green),),

                myDivider(),

                Text("Semak For Cosmetics" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15)),

                SizedBox(

                  height: 5,

                ),

                Row(

                  children: [

                    Expanded(child: Text("امام مركز البحوث, 64 التحرير، الدقي، قسم الدقي" ,  style: TextStyle(color: Colors.grey))),

                    CircleAvatar(

                      backgroundColor: Colors.yellow[900],

                      child: IconButton(onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Text("Quantification" , style: TextStyle(fontWeight: FontWeight.bold),),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    Text("Company : Semak For Cosmetics"),
                                    Text("Address : امام مركز البحوث, 64 التحرير، الدقي، قسم الدقي"),

                                    SizedBox(
                                      height: 10,
                                    ),

                                    Row(
                                      children: [
                                        Text("Quantity Available : " , style: TextStyle(color: Colors.black),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("1500 pieces" , style: TextStyle(color: Colors.green),),
                                      ],
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                      label: Text("Type the quantity"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: MaterialButton(onPressed: (){},
                                              color: Colors.red,
                                              child: Text("Cancle"),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          MaterialButton(onPressed: (){},
                                            color: Colors.green,
                                            child: Text("Ok"),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      },

                          icon: Icon(Icons.shopping_cart, color: Colors.white,)

                      ),

                    ),

                  ],

                ),

                SizedBox(
                  height: 5,
                ),
                Text("Stock : 1500 pieces" , style: TextStyle(color: Colors.green),),

                myDivider(),

                Text("Spire Pharma" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15)),

                SizedBox(

                  height: 5,

                ),

                Row(

                  children: [

                    Expanded(child: Text("Alexandria, Smouha, Riada School Street, Saraya Gardens Compound H, الإسكندرية 21500" ,  style: TextStyle(color: Colors.grey))),

                    CircleAvatar(

                      backgroundColor: Colors.yellow[900],

                      child: IconButton(onPressed: (){},

                          icon: Icon(Icons.shopping_cart, color: Colors.white,)

                      ),

                    ),

                  ],

                ),

                SizedBox(
                  height: 5,
                ),
                Text("Stock : 1950 pieces" , style: TextStyle(color: Colors.green),),

                myDivider(),

                Text("Brilliance Pharmaceutical" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15)),

                SizedBox(

                  height: 5,

                ),

                Row(

                  children: [

                    Expanded(child: Text("205 app, A2, Grand Ville Smouha, 21924" ,  style: TextStyle(color: Colors.grey))),

                    CircleAvatar(

                      backgroundColor: Colors.yellow[900],

                      child: IconButton(onPressed: (){},

                          icon: Icon(Icons.shopping_cart, color: Colors.white,)

                      ),

                    ),

                  ],

                ),

                SizedBox(
                  height: 5,
                ),
                Text("Stock : 430 pieces" , style: TextStyle(color: Colors.green),),

              ],

            ),

          ),

        ],

      ),
    ),

  ),

);









Widget myDivider() => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
);


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void NavigatAndFinish (context , widget)=> Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context) => widget), (Route<dynamic>route) => false);
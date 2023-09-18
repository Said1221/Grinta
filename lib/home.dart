
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/admin.dart';
import 'package:grinta/component.dart';
import 'package:grinta/cubit.dart';
import 'package:grinta/state.dart';

class home extends StatelessWidget {

  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>AppCubit()..getMedicine()..getUser(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
        builder: (BuildContext context , AppState state){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title:  Row(
                children: [
                  Image(image: AssetImage('assets/slack.png'),width: 30,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(cubit.title[cubit.currentIndex] , style: TextStyle(color: Colors.green),),
                ],
              ),
              actions: [
               IconButton(onPressed: (){
                 navigateTo(context, admin());
               },
                   icon: Icon(Icons.search , color: Colors.black,),
               ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),

            body: cubit.screens[cubit.currentIndex],


            bottomNavigationBar: BottomNavigationBar(



              iconSize: 30,

              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.yellow[900],
              currentIndex: cubit.currentIndex,

              onTap: (index){
                cubit.onItemTapped(index);
              },

              items: [

                BottomNavigationBarItem(
                  icon : Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon : Stack(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                      ),
                    ],
                  ),
                  label: 'Cart',
                ),


                BottomNavigationBarItem(
                  icon : Icon(
                    Icons.account_circle,
                  ),
                  label: 'Account',
                ),




                BottomNavigationBarItem(
                  icon : Icon(
                    Icons.settings,
                  ),
                  label: 'Setting',
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}

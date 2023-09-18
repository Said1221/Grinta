
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/component.dart';
import 'package:grinta/cubit.dart';
import 'package:grinta/state.dart';

class feeds extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>AppCubit()..getMedicine(),
      child: BlocConsumer<AppCubit , AppState>(
        listener: (BuildContext context , AppState state){},
        builder: (BuildContext context , AppState state){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            body: itemsBuilder(cubit.medicine, context),
          );
        },
      ),
    );




  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grinta/register/Registeration_model.dart';
import 'package:grinta/register/register_state.dart';


class RegCubit extends Cubit<RegState>{

  RegCubit() : super (RegInitialState());



  static RegCubit get(context)=>BlocProvider.of(context);


  void userReg({
     String name,
     String email,
     String gov,
     String phone,
     String phName,
     String phAdd,
     String password,
  }){
    emit(RegInitialState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value){
      creatUser(
        name: name,
        email: email,
        gov: gov,
        phone: phone,
        phName: phName,
        phAdd: phAdd,
        Uid:value.user.uid,
      );
    }).catchError((error){
      emit(RegErrorState());
    });
  }

  void creatUser({
     String name,
     String email,
     String gov,
     String phName,
     String phAdd,
     String phone,
     String Uid,

  }){

    RegisterModel model = RegisterModel(
      name: name,
      email: email,
      gov: gov,
      phone: phone,
      phName: phName,
      phAdd: phAdd,
      Uid: Uid,
    );

    FirebaseFirestore.instance.collection('user').doc(Uid).set(model.toMap())
        .then((value){
      emit(RegCreateUserSuccessState());
    }).catchError((error){
      emit(RegCreateUserErrorState());
    });

  }


}
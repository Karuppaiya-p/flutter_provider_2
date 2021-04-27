import 'package:blocprovider/bloc/bloc.dart';
import 'package:flutter/material.dart';

class NameProvider with ChangeNotifier{
  String _firstName="First";
  String _lastName="Last";
  NameBloc _bloc;

  String get firstName =>_firstName;
  String get lastName => _lastName;
  NameBloc get bloc=>_bloc;

  NameProvider(){
    _bloc = NameBloc();
  }

  void setFirstName(String firstName){
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName){
    _lastName=lastName;
    notifyListeners();
  } 
}
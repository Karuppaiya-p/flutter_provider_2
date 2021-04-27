import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class NameBloc{
  //Declare Streams
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();

  //get
  Stream<String> get firstName => _firstName.stream.transform(validateFirstName);
  Stream<String> get lastName => _lastName.stream;
  Stream<bool> get nameValid => Rx.combineLatest2(firstName, lastName, (a, b) => true);


  //set
  Function(String) get changeFirstName => _firstName.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;

  //validator
  final validateFirstName = StreamTransformer<String, String>.fromHandlers(
    handleData: (fname, sink) => {
      if(fname.length<3){
        sink.addError("Minimum 3 Characters")
      }
      else{
          sink.add(fname)
      }
    },
  );
  dispose(){
    _firstName.close();
    _lastName.close();
  }
}
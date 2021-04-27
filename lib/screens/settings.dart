import 'package:blocprovider/provider/name_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<NameProvider>(context).bloc;
    final providerData =Provider.of<NameProvider>(context);
    final firstNameController=TextEditingController();
    final lastNameController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(padding: EdgeInsets.all(40.0),child: Column(children: <Widget>[
          StreamBuilder<String>(
            stream: bloc.firstName,
            builder: (context, snapshot) {
              return TextField(decoration: InputDecoration(labelText: "FirstName", errorText: snapshot.error
              ), onChanged: bloc.changeFirstName, controller: firstNameController,);
            }
          ),
          StreamBuilder<String>(
            stream: bloc.lastName,
            builder: (context, snapshot) {
              return TextField(decoration: InputDecoration(labelText: "LastName"), onChanged: bloc.changeLastName , controller: lastNameController,);
            }
          ),
          StreamBuilder<bool>( 
            stream: bloc.nameValid,
            builder: (context, snapshot) {
              return ElevatedButton(onPressed: !snapshot.hasData?null: (){
                providerData.setFirstName(firstNameController.text);
                providerData.setLastName(lastNameController.text);
                Navigator.pop(context);
              }, child: Text("SAVE"), );
            }
          )
      ],
      
      
      ),),
    );
  }
}
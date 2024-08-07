
import 'package:covidalert/Services/StatesServices.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  @override
  State<Dropdown> createState() => _dropdownButtonState();
}

class _dropdownButtonState extends State<Dropdown> {
  StatesServices statesServices=StatesServices();
  var selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Dropdown practice"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
                  future:statesServices.CountriesData(),
                  builder: (context, snapshot) {

                    if(snapshot.hasData){
                      return DropdownButton(
                          hint: Text("Select value"),
                          value: selectedvalue,
                          items:snapshot.data!.map((e){
                            return DropdownMenuItem(
                                value: e.country!,
                                child:Text(e.country!)
                            );
                          }).toList(),
                          onChanged: (value){
                            selectedvalue=value;
                            setState(() {});
                          });
                    }
                    else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
          )
    );
  }
}


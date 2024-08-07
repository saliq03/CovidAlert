import 'package:dropdown_button2/dropdown_button2.dart';
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
          child: Column(
            children: [
              FutureBuilder(
                  future:statesServices.CountriesData(),
                  builder: (context, snapshot) {
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
                  }),

              SizedBox(height: 30,),
              selectedvalue!=null?Text(selectedvalue):Text('none')
            ],
          )

      ),
    );
  }
}


import 'package:covidalert/Models/CountriesJsonModel.dart';
import 'package:covidalert/Services/StatesServices.dart';
import 'package:flutter/material.dart';

class Countriespage extends StatefulWidget {
  const Countriespage({super.key});

  @override
  State<Countriespage> createState() => _CountriespageState();
}

class _CountriespageState extends State<Countriespage> {
  StatesServices statesServices=StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(),
            FutureBuilder(
                future: statesServices.CountriesData(),
                builder: (context,AsyncSnapshot<List<CountriesJsonModel>> snapshot){
                  if(snapshot.hasData){
                    return Text('data');
                  }
                  else{
                    return Text('loading');
                  }
                })
          ],
        ),
      ),
    );
  }
}

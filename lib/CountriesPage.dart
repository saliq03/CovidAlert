import 'dart:math';

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
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextField(
                controller: searchController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search country",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                  ),
                ),
              ),
              FutureBuilder(
                  future: statesServices.CountriesData(),
                  builder: (context,AsyncSnapshot<List<CountriesJsonModel>> snapshot){
                    if(snapshot.hasData){
                      return Expanded(
                        child: ListView.builder(itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                          return ListTile(
                            leading: Image(
                              height: 50,
                              width: 70,
                              image: NetworkImage(snapshot.data![index].countryInfo!.flag!),
                            ),
                            title: Text(snapshot.data![index].country!,style: TextStyle(color: Colors.white,fontSize: 20),),
                          );

                        }),
                      );
                    }
                    else{
                      return Text('loading');
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

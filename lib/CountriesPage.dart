
import 'package:covidalert/Models/CountriesJsonModel.dart';
import 'package:covidalert/Services/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
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
                onChanged: (value){
                  setState(() {});
                },
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
              SizedBox(height: 15),
              FutureBuilder(
                  future: statesServices.CountriesData(),
                  builder: (context,AsyncSnapshot<List<CountriesJsonModel>> snapshot){
                    if(snapshot.hasData){
                      return Expanded(
                        child: ListView.builder(itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                          String name=snapshot.data![index].country!;
                          if(searchController.text==''){
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 70,
                                    image: NetworkImage(snapshot.data![index].countryInfo!.flag!),
                                  ),
                                  title: Text(name,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  subtitle:Text(snapshot.data![index].cases!.toString(),style: TextStyle(color: Colors.white),),
                                ),
                                SizedBox(height: 10,)
                              ],
                            );
                          }
                          else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image(
                                    height: 50,
                                    width: 70,
                                    image: NetworkImage(snapshot.data![index].countryInfo!.flag!),
                                  ),
                                  title: Text(name,style: TextStyle(color: Colors.white,fontSize: 20),),
                                  subtitle:Text(snapshot.data![index].cases!.toString(),style: TextStyle(color: Colors.white),),
                                ),
                                SizedBox(height: 10,)
                              ],
                            );
                          }
                          else{
                            return Container(color: Colors.redAccent,);
                          }


                        }),
                      );
                    }
                    else{
                      return ShimmerContainer(
                        height: 80,
                        width: 350,
                        radius: 4,
                        highlightColor: Color(0xffF9F9FB),
                        baseColor: Color(0xffE6E8EB),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

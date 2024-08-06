
import 'package:covidalert/Detailed.dart';
import 'package:covidalert/Models/CountriesJsonModel.dart';
import 'package:covidalert/Services/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Countriespage extends StatefulWidget {
  const Countriespage({super.key});

  @override
  State<Countriespage> createState() => _CountriespageState();
}

class _CountriespageState extends State<Countriespage> {
  final ScrollController _scrollController=ScrollController();
  StatesServices statesServices=StatesServices();
  TextEditingController searchController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((){
      FocusScope.of(context).unfocus();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextField(
                controller: searchController,
                onChanged: (value){
                  setState(() {});
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search country",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.search,color: Colors.white,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      )
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FutureBuilder(
                  future: statesServices.CountriesData(),
                  builder: (context,AsyncSnapshot<List<CountriesJsonModel>> snapshot){
                    if(snapshot.hasData){
                      return Expanded(
                        child: ListView.builder(controller: _scrollController,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                          String name=snapshot.data![index].country!;
                          if(searchController.text==''){
                            return GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>Detailed(
                                    name: name,
                                    cases: snapshot.data![index].cases!.toString(),
                                    flag: snapshot.data![index].countryInfo!.flag!,
                                    deaths: snapshot.data![index].deaths!.toString(),
                                    recovered: snapshot.data![index].recovered!.toString(),
                                    active: snapshot.data![index].active!.toString(),
                                    population: snapshot.data![index].population!.toString(),
                                    critical: snapshot.data![index].critical!.toString(),
                                    todayRecovered: snapshot.data![index].todayRecovered!.toString())));
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 70,
                                      image: NetworkImage(snapshot.data![index].countryInfo!.flag!),
                                    ),
                                    title: Text(name,style: const TextStyle(color: Colors.white,fontSize: 20),),
                                    subtitle:Text(snapshot.data![index].cases!.toString(),style: const TextStyle(color: Colors.white),),
                                  ),
                                  const SizedBox(height: 10,)
                                ],
                              ),
                            );
                          }
                          else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>Detailed(
                                    name: name,
                                    cases: snapshot.data![index].cases!.toString(),
                                    flag: snapshot.data![index].countryInfo!.flag!,
                                    deaths: snapshot.data![index].deaths!.toString(),
                                    recovered: snapshot.data![index].recovered!.toString(),
                                    active: snapshot.data![index].active!.toString(),
                                    population: snapshot.data![index].population!.toString(),
                                    critical: snapshot.data![index].critical!.toString(),
                                    todayRecovered: snapshot.data![index].todayRecovered!.toString())));
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Image(
                                      height: 50,
                                      width: 70,
                                      image: NetworkImage(snapshot.data![index].countryInfo!.flag!),
                                    ),
                                    title: Text(name,style: const TextStyle(color: Colors.white,fontSize: 20),),
                                    subtitle:Text(snapshot.data![index].cases!.toString(),style: const TextStyle(color: Colors.white),),
                                  ),
                                  const SizedBox(height: 10,)
                                ],
                              ),
                            );
                          }
                          else{
                            return Container(color: Colors.redAccent,);
                          }


                        }),
                      );
                    }
                    else{
                      return Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                           return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading:Container(height: 50,width: 50,color: Colors.white,),
                                      title: Container(height: 10,width: 90,color: Colors.white,),
                                      subtitle:Container(height: 8,color: Colors.white,),
                                    ),
                                   const SizedBox(height: 10,)
                                  ],
                                ));
                          },
                        
                        ),
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

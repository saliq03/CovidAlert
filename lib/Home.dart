import 'package:covidalert/Services/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'Models/StateJsonModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StatesServices statesServices= StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Column(
          children: [
           const SizedBox(height: 20),

           FutureBuilder(
               future: statesServices.WorldDAta(),
               builder: (context,AsyncSnapshot<StateJsonModel> snapshot){
                 if(!snapshot.hasData){
                   return Text(data);
                 }
                 else{
                   return Column(
                     children: [
                       const PieChart(
                         dataMap:{
                           "Total":20,
                           "Death":15,
                           "Recovered":5
                         },
                         animationDuration: Duration(milliseconds: 1000),
                         chartType: ChartType.ring,
                         legendOptions: LegendOptions(
                           legendPosition: LegendPosition.left,
                           legendTextStyle:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                         ),
                         chartRadius: 150,

                       ),
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Card(
                           child: Container(
                             padding: const EdgeInsets.all(10),
                             child: Column(
                               children: [
                                 reusableRow("Total", "20"),
                                 reusableRow("Total", "20"),
                                 reusableRow("Total", "20"),
                               ],
                             ),
                           ),
                         ),
                       ),
                       const SizedBox(height: 20,),
                       Container(
                         padding:const EdgeInsets.symmetric(vertical: 15),
                         margin:const EdgeInsets.symmetric(horizontal: 20),
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.circular(11)
                         ),
                         child:const Center(child: Text("Track Countries",style: TextStyle(fontWeight: FontWeight.bold),)),

                       )
                     ],
                   );
                 }
               })


          ],
        ),
      ),
    );
  }

  reusableRow(String title,String value){
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value)
          ],
        ),
       const Divider(),
      ],
    );
  }
}

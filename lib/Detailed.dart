import 'package:flutter/material.dart';

class Detailed extends StatefulWidget {
  final String name;
  final String cases;
  final String flag;
  final String deaths;
  final String recovered;
  final String active;
  final String population;
  final String critical;
  final String todayRecovered;

  const Detailed({ required this.name, required this.cases, required this.flag, required this.deaths, required this.recovered, required this.active, required this.population, required this.critical, required this.todayRecovered});

  @override
  State<Detailed> createState() => _DetailedState();
}

class _DetailedState extends State<Detailed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                 Padding(
                   padding: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.067,left: 15,right: 15),
                   child: Card(
                     color: Colors.grey.shade800,
                     child: Column(
                       children: [
                         SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                         reusableRow("  Cases", widget.cases),
                         reusableRow("  Deaths", widget.deaths),
                         reusableRow("  Recovered", widget.recovered),
                         reusableRow("  Active", widget.active),
                         reusableRow("  Critical", widget.critical),
                         reusableRow("  Population", widget.population),
                         reusableRow("  Today Recovered", widget.todayRecovered),

                       ],
                     ),
                   ),
                 ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.flag),
                )
              ],
            ),
          ],

      ) ,
    );
  }

  reusableRow(String title,String value){
    return Column(
      children: [
        SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
            Text("$value  ",style: TextStyle(color: Colors.white,fontSize: 16),)
          ],
        ),
         SizedBox(height: 5),
         Divider(color:Colors.grey.shade700),
      ],
    );
  }
}

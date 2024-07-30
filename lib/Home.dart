
import 'package:covidalert/Services/StatesServices.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Models/StateJsonModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  late final AnimationController _controller=AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,)..repeat();
  StatesServices statesServices= StatesServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
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
                   return Expanded(
                       child: SpinKitFadingCircle(
                         color:Colors.white,
                         size: 50,
                         controller: _controller,
                       )

                   );
                 }
                 else{
                   return Column(
                     children: [
                        PieChart(
                         dataMap:{
                           "Total":double.parse(snapshot.data!.cases.toString()),
                           "Death":double.parse(snapshot.data!.deaths.toString()),
                           "Recovered":double.parse(snapshot.data!.recovered.toString())
                         },
                         animationDuration: const Duration(milliseconds: 1000),
                         chartType: ChartType.ring,
                          chartValuesOptions: const ChartValuesOptions(showChartValuesInPercentage: true),
                         legendOptions: const LegendOptions(
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
                             color: Colors.black54,
                             child: Column(
                               children: [
                                 reusableRow("Total", snapshot.data!.cases.toString()),
                                 reusableRow("Recovered", snapshot.data!.recovered.toString()),
                                 reusableRow("Deaths", snapshot.data!.deaths.toString()),
                                 reusableRow("Active", snapshot.data!.active.toString()),
                                 reusableRow("Critical", snapshot.data!.critical.toString()),
                                 reusableRow("Today cases", snapshot.data!.todayCases.toString()),
                                 reusableRow("Today deaths", snapshot.data!.todayDeaths.toString()),
                                 reusableRow("Today recovered", snapshot.data!.todayRecovered.toString()),
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
                         child:const Center(child: Text("Track Countries",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),)),

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
            Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            Text(value,style: TextStyle(color: Colors.white),)
          ],
        ),
       const Divider(),
      ],
    );
  }
}

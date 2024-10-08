
import 'dart:convert';
import 'package:covidalert/Models/CountriesJsonModel.dart';
import 'package:covidalert/Services/Util/AppUrl.dart';
import 'package:http/http.dart' as http;
import '../Models/StateJsonModel.dart';

class StatesServices{
   Future <StateJsonModel> WorldDAta()async{
    final response= await http.get(Uri.parse(AppUrl.worldStates));
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);
      return  StateJsonModel.fromJson(jsonData);
    }
    else{
      throw Exception('Error');
    }
  }

  Future<List<CountriesJsonModel>> CountriesData()async{
     List<CountriesJsonModel> countrylist=[];
     final response=await http.get(Uri.parse(AppUrl.countryStates));
     if(response.statusCode==200){
       var jsonData=jsonDecode(response.body);

       for(Map<String,dynamic> data in jsonData){
         countrylist.add(CountriesJsonModel.fromJson(data));
       }
       return countrylist;
     }
     else {
       throw Exception("error");
     }
  }


}




import 'dart:convert';

import 'package:covidalert/Services/Util/AppUrl.dart';
import 'package:http/http.dart' as http;
import '../Models/StateJsonModel.dart';

class StatesServices{
   Future <StateJsonModel> WorldDAta()async{
    final response= await http.get(Uri.parse(AppUrl.worldStates));
    print(response.statusCode);
    if(response.statusCode==200){
      var jsonData=jsonDecode(response.body);

      print(jsonData);
      return  StateJsonModel.fromJson(jsonData);
    }
    else{
      throw Exception('Error');
    }
  }
}

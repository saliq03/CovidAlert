
import 'package:covidalert/Services/Util/AppUrl.dart';
import 'package:http/http.dart' as http;
import '../Models/StateJsonModel.dart';

class StatesServices{
  WorldDAta()async{
    var response= await http.get(Uri.parse(AppUrl.worldStates));
    if(response.statusCode==200){
      var jsonData=StateJsonModel.fromJson(response.body);
      return jsonData;
    }
    else{
      return;
    }
  }
}

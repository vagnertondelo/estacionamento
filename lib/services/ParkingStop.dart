import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ParkingSpot.dart';
import '../models/ParkingSpotList.dart';


class ParkingSpotService{

  String urlGetListParkingSpot = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/list";
  String salvar = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/save";
  String edit = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/edit";
  String delete = "https://parking-spot-238adfbb7467.herokuapp.com/parking-spot/delete";

  dynamic _response;
  ParkingSpotService(){
    _response="";
  }

  Future<ParkingSpotList> fetchListParkingSpot() async {
    _response = await http.get(Uri.parse(urlGetListParkingSpot));
    if (_response.statusCode == 200) {
      List<dynamic> list = json.decode(_response.body);
      return ParkingSpotList.fromJson(list);
    } else {
      throw Exception('Failed to load cote');
    }
  }

  //create a fetch to delete
  Future<dynamic> fetchDeleteGarage(ParkingSpotModel objeto) async {
    _response = await http.post(Uri.parse(delete+"/"+objeto.id.toString()));
    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> fetchEditGarage(ParkingSpotModel objeto) async {
    _response = await http.post(Uri.parse(edit),body: json.encode(objeto.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return _response.body;
    } else {
      return false;
    }
  }

  Future<dynamic> fetchPostGarage(ParkingSpotModel garage) async {
    _response = await http.post(Uri.parse(salvar),body: json.encode(garage.toJson()) ,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ParkingSpotModel.fromJson(retorno) ;
    } else {
      return false;
    }

  }
}








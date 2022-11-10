import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gps/models/ubication.dart';
import 'package:gps/models/ubication_response.dart';
import 'package:http/http.dart' as http;

class UbicationProvider extends ChangeNotifier {
  final String _baseUrl =
      "https://us-central1-internet-de-las-cosas-368001.cloudfunctions.net/api_IOT/obtenerDataGPS";
  // final String _apiKey = "jkUnat1ZWNnzt3fgVuuyLLdMT7Q9QS5OVfEeFlgM";

  Payload onDisplayData = Payload(
      idGsmGps: 1,
      longitudGps: 0,
      latitudGps: 0,
      fecha: DateTime(0),
      hora: "espere...",
      idUserFk: 1);

  UbicationProvider() {
    // ignore: avoid_print
    print("Ubication Provider initializado");
    getUbicationProvider();
  }

  getUbicationProvider() async {
    // ignore: avoid_print
    // final url = Uri.https(_baseUrl, '/planetary/apod', {'api_key': _apiKey});
    final url = Uri.parse(_baseUrl);

    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);

    final data = UbicationResponse.fromMap(decodeData);

    onDisplayData = data.payload;

    print(onDisplayData.longitudGps);

    notifyListeners();
  }
}

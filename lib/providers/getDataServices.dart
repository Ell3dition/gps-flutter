// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gps/models/ubication.dart';
import 'package:gps/models/ubication_response.dart';
import 'package:http/http.dart' as http;

class UbicationProviderNew extends ChangeNotifier {
  final String _baseUrl =
      "https://us-central1-internet-de-las-cosas-368001.cloudfunctions.net/api_IOT/obtenerDataGPS";
  // final String _apiKey = "jkUnat1ZWNnzt3fgVuuyLLdMT7Q9QS5OVfEeFlgM";

  UbicationProviderNew() {
    // ignore: avoid_print
    print("Ubication Provider initializado");
    // getUbicationProvider();
  }

  Future<Payload> getData() async {
    final url = Uri.parse(_baseUrl);
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    final data = UbicationResponse.fromMap(decodeData);
    return data.payload;
  }
}

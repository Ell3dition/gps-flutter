// To parse this JSON data, do
//
//     final ubicationResponse = ubicationResponseFromMap(jsonString);

import 'dart:convert';

import 'package:gps/models/ubication.dart';

class UbicationResponse {
  UbicationResponse({
    required this.codigo,
    required this.mensaje,
    required this.payload,
  });

  int codigo;
  String mensaje;
  Payload payload;

  factory UbicationResponse.fromJson(String str) =>
      UbicationResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UbicationResponse.fromMap(Map<String, dynamic> json) =>
      UbicationResponse(
        codigo: json["codigo"],
        mensaje: json["Mensaje"],
        payload: Payload.fromMap(json["payload"]),
      );

  Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "Mensaje": mensaje,
        "payload": payload.toMap(),
      };
}

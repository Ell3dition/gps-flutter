// To parse this JSON data, do
//
//     final ubicationResponse = ubicationResponseFromMap(jsonString);

import 'dart:convert';

class Payload {
  Payload({
    required this.idGsmGps,
    required this.longitudGps,
    required this.latitudGps,
    required this.fecha,
    required this.hora,
    required this.idUserFk,
  });

  int idGsmGps;
  double longitudGps;
  double latitudGps;
  DateTime fecha;
  String hora;
  int idUserFk;

  factory Payload.fromJson(String str) => Payload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payload.fromMap(Map<String, dynamic> json) => Payload(
        idGsmGps: json["ID_GSM_GPS"],
        longitudGps: json["LONGITUD_GPS"].toDouble(),
        latitudGps: json["LATITUD_GPS"].toDouble(),
        fecha: DateTime.parse(json["FECHA"]),
        hora: json["HORA"],
        idUserFk: json["ID_USER_FK"],
      );

  Map<String, dynamic> toMap() => {
        "ID_GSM_GPS": idGsmGps,
        "LONGITUD_GPS": longitudGps,
        "LATITUD_GPS": latitudGps,
        "FECHA":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "HORA": hora,
        "ID_USER_FK": idUserFk,
      };
}

import 'package:flutter/material.dart';
import 'package:gps/providers/getDataServices.dart';
import 'package:gps/screen/googleMaps.dart';
import 'package:provider/provider.dart';
import 'package:gps/providers/ubication_providerOld.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UbicationProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPS + GSM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GPS + GSM ES2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double latitud = -35.4251927;
  double longitud = -71.6595915;
  DateTime fecha = DateTime(0);
  String hora = "";
  String actualizacion = "Aún no obtiene la ubicación";

  @override
  Widget build(BuildContext context) {
    print(latitud);
    DateTime now;
    String convertedDateTime;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Text(
              "Latitud: $latitud",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              "Longitud: $longitud",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              "Fecha: ${fecha.day}-${fecha.month}-${fecha.year} ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              "Hora: $hora",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: const Color.fromARGB(255, 60, 113, 163),
                onPressed: () => {
                      UbicationProviderNew().getData().then((value) => {
                            now = DateTime.now(),
                            convertedDateTime =
                                "${now.day.toString()}-${now.month.toString().padLeft(2, '0')}-${now.year.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}",
                            setState(() => {
                                  latitud = value.latitudGps,
                                  longitud = value.longitudGps,
                                  fecha = value.fecha,
                                  hora = value.hora,
                                  actualizacion = convertedDateTime
                                }),
                          }),
                    },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: const Text('Obtener Ubicación',
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                )),
            const SizedBox(height: 15),
            Text(
              "Última Actualización: $actualizacion",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Expanded(
              child: Maps(
                latitud: latitud,
                longitud: longitud,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

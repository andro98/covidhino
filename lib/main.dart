import 'package:covidhino/src/view/screens/main_screen.dart';
import 'package:covidhino/src/view_model/covid_provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(ChangeNotifierProvider(
      create: (_) => CovidProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff503CAA),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covidhino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:MainScreen(),
    );
  }
}

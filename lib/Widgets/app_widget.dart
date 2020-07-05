import 'package:counter/counterlib.dart';
import 'package:flutter/material.dart';
import 'counterpage_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider(
        create:(_) => CounterBloc(CounterService(0)),
        child:CounterPage()
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:provider ,
    );
  }
}
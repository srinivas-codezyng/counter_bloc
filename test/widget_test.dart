// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter/counterlib.dart';
import 'package:mockito/mockito.dart';

import 'package:counterbloc/main.dart';

void main() {
  group('CounterBloc', (){
    blocTest('Initialize',
      build: () async {
        return CounterBloc(CounterService(0));
      } ,
      skip: 0,
      expect: [CounterLoadingSuccess(0)],
    );
    blocTest('Increment',
      build: () async {
        return CounterBloc(CounterService(0));
      } ,
        act:(counterBloc) => counterBloc.add(CounterEvent.increment),
      expect: [isA<CounterLoadInProgress>(),CounterLoadingSuccess(1)],
    );
  });

}

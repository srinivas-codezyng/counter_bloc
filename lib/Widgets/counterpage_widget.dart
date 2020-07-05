import 'package:counter/counterlib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(

        title: Text("Counter"),
      ),
      body: Center(
        child:BlocBuilder<CounterBloc,CounterState>(
          builder: (context,state) {
            if( state is CounterLoadingSuccess) {
              return Text('You have pushed the button ${(state as CounterLoadingSuccess).count}');
            }else{
              return Text('In Progress');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          print('${counterBloc.state}');
          if (counterBloc.state is! CounterLoadInProgress)
          counterBloc.add(CounterEvent.increment);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

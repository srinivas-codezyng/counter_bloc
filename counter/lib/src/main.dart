import 'package:counter/counter.dart';

void main(){
  final counter = CounterBloc();

  counter.listen(print);

  counter.add(CounterEvent.increment);
  counter.add(CounterEvent.decrement);
  counter.add(CounterEvent.increment);
  counter.add(CounterEvent.decrement);

}
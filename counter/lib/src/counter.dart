library counter;

import 'dart:async';
import 'package:bloc/bloc.dart';

enum CounterEvent {
  increment,
  decrement
}

class CounterService  {
  int value;

  CounterService(this.value);

  Future<int> increment() async {
    await Future.delayed(Duration(seconds: 3),(){
    });
    value = value + 1;

    return value;
  }

  Future<int> decrement() async {
    await Future.delayed(Duration(seconds: 3),(){
    });
    value = value - 1;

    return value;
  }

}

abstract class CounterState{
  const CounterState();
}

class CounterLoadInProgress extends CounterState {

}

class CounterLoadingSuccess extends CounterState {
  final int count;
  const CounterLoadingSuccess(this.count);

  bool operator==(other) {
    if(other is! CounterLoadingSuccess) {
      return false;
    }

    return count == (other as CounterLoadingSuccess).count;
  }
}

class CounterLoadFailure extends CounterState {

}

class CounterBloc extends Bloc<CounterEvent,CounterState> {

  final CounterService _counterService;

  CounterBloc(this._counterService):super(CounterLoadingSuccess(_counterService.value));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch(event){
      case CounterEvent.increment:
        yield *_mapIncrementToState();
        break;
      case CounterEvent.decrement:
        yield *_mapDecrementToState();
        break;
    }
  }

  Stream<CounterState> _mapIncrementToState () async* {
    yield CounterLoadInProgress();

    try{
      final asyncCount = await _counterService.increment();
      yield CounterLoadingSuccess(asyncCount);
    }catch (_){
      yield CounterLoadFailure();
    }

  }

  Stream<CounterState> _mapDecrementToState () async* {
    yield CounterLoadInProgress();

    try{
      final asyncCount = await _counterService.decrement();
      yield CounterLoadingSuccess(asyncCount);
    }catch (_){
      yield CounterLoadFailure();
    }

  }
}
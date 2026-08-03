import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter/counter_event.dart';
import 'package:state_management/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncrement>(_onIncrement);
    on<CounterReset>(_onReset);
  }

  void _onIncrement(CounterIncrement event, Emitter<CounterState> emit) {
    emit(CounterState(count: state.count + 1));
  }

  void _onReset(CounterReset event, Emitter<CounterState> emit) {
    emit(const CounterState(count: 0));
  }
}

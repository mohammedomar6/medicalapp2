

import 'package:bloc/bloc.dart';

import '../chronicitem.dart';

part 'chronic_state.dart';

class ChronicCubit extends Cubit<ChronicState> {
  ChronicCubit() : super(ChronicState());
addChronic(ChronicItem item){
  emit(state.copyWith(list:List.of(state.list)..add(item)));
}
}

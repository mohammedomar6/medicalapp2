
import 'package:bloc/bloc.dart';

import '../pharmaceutical_item.dart';



part 'pharmaceutical_state.dart';

class PharmaCubit extends Cubit<PharmaState> {
  PharmaCubit() : super(PharmaState());
  add(PharmaceuticalItem item){
    emit(state.copyWith(list:List.of(state.list)..add(item)));
  }
}


import 'package:bloc/bloc.dart';

import '../appoitments_item.dart';


part 'Appointment_state.dart';

class AppoitmentCubit extends Cubit<AppoimtmentState> {
  AppoitmentCubit() : super(AppoimtmentState());
  addChronic(AppoitmentsItem item){
    emit(state.copyWith(list:List.of(state.list)..add(item)));
  }
}

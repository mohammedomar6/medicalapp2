
import 'package:bloc/bloc.dart';

import '../date_family_item.dart';



part 'date_family_state.dart';

class DateFamilyCubit extends Cubit<DateFamilyState> {
  DateFamilyCubit() : super(DateFamilyState());
  addDateFamily(DateFamilyItem item){
    emit(state.copyWith(list:List.of(state.list)..add(item)));
  }
}

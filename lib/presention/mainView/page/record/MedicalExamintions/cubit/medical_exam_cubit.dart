

import 'package:bloc/bloc.dart';

import '../ItemMedicalExam.dart';

part  'medical_exam_state.dart';

class MedicalExamCubit extends Cubit<MedicalExamState> {
  MedicalExamCubit() : super(MedicalExamState());
  addExam(ItemExam item){
    emit(state.copyWith(list:List.of(state.list)..add(item)));
  }
}

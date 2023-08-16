part of 'medical_exam_cubit.dart';





class MedicalExamState {
  MedicalExamState({ this.list= const []});
  final List<ItemExam>  list ;
  MedicalExamState copyWith({
    List<ItemExam>? list,
  }) {
    return MedicalExamState(
      list:list ?? this.list,
    );
  }
}
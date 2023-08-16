part of 'Appointment_cubit.dart';


class AppoimtmentState {
  AppoimtmentState({ this.list= const []});
  final List<AppoitmentsItem>  list ;
  AppoimtmentState copyWith({
    List<AppoitmentsItem>? list,
  }) {
    return AppoimtmentState(
      list:list ?? this.list,
    );
  }
}
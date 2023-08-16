part of 'pharmaceutical_cubit.dart';





class PharmaState {
  PharmaState({ this.list= const []});
  final List<PharmaceuticalItem>  list ;
  PharmaState copyWith({
    List<PharmaceuticalItem>? list,
  }) {
    return PharmaState(
      list:list ?? this.list,
    );
  }
}
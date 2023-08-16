part of 'chronic_cubit.dart';
class ChronicState {
  ChronicState({ this.list= const []});
final List<ChronicItem>  list ;
  ChronicState copyWith({
    List<ChronicItem>? list,
  }) {
    return ChronicState(
      list:list ?? this.list,
    );
  }
}
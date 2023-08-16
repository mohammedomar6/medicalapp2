part of 'date_family_cubit.dart';

class DateFamilyState {
  DateFamilyState({ this.list= const []});
  final List<DateFamilyItem>  list ;
  DateFamilyState copyWith({
    List<DateFamilyItem>? list,
  }) {
    return DateFamilyState(
      list:list ?? this.list,
    );
  }
}
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/AppointmentBooking/Cubit/Appointment_cubit.dart';
class ReservationConfirmation extends StatefulWidget {
   ReservationConfirmation( this.appoitmentCubit, {super.key});
  AppoitmentCubit appoitmentCubit ;
  @override
  State<ReservationConfirmation> createState() => _ReservationConfirmationState();
}

class _ReservationConfirmationState extends State<ReservationConfirmation> {
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: selectedDate,
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (time != null) {
        setState(() {
          fullDate = DateTimeField.combine(date, time);
        });
        //TODO
        //schedule a notification
      }
      return DateTimeField.combine(date, time);
    } else {
      return selectedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Methodes.buildAppBararrow(context, "Reservation Confirmation"),
      body: Container(
        child: Column(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            TextFormField(
              decoration: Methodes.buildInputDecoration("Enter date", "", null, null),
              onTap: (){
                _selectDate(context);
              },
            )
          ],
        ),
      ),

    );
  }
}

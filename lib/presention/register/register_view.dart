import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  var c = TextEditingController();
  var valueGender = "Male";
  var controllerdatepicker = TextEditingController();
  var currentstep = 0;

  onStepCancel() {
    setState(() {
      if (currentstep > 0) currentstep = currentstep - 1;
    });
  }

  onStepContinue() {
    if (!(globalKey.currentState!.validate())) {
      return;
    }
    setState(() {
      if (currentstep < 2) currentstep = currentstep + 1;
      isactivestep = true;
    });
  }

  var isactivestep = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: Methodes.buildAppBar(
          context: context, title: "Sign Up", routeleading: Routes.loginRoutes),
      body: Form(
        key: globalKey,
        child: Container(
          color: ColorManger.background,
          child: Theme(
            data: ThemeData(

                  canvasColor: ColorManger.textcolor,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: ColorManger.background,
                    background: ColorManger.cyen50,
                    secondary: ColorManger.textcolor,
                  ),
                ),
            child: Stepper(
              onStepCancel: onStepCancel,
              onStepContinue: onStepContinue,
              controlsBuilder: (context, v) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                        color: ColorManger.textcolor,
                        child: TextButton(
                          onPressed: v.onStepContinue,
                          child: Text(
                            "Continou",
                            style: TextStyle(color: ColorManger.cyen50),
                          ),
                        )),
                    Container(
                        color: ColorManger.textcolor,
                        margin: EdgeInsets.all(12),

                        child: TextButton(

                            onPressed: v.onStepCancel, child: Text("Back", style: TextStyle(color: ColorManger.cyen50),))),
                  ],
                );
              },
              onStepTapped: (val) {

                setState(() {

                  currentstep = val;
                });
              },
              type: StepperType.horizontal,
              steps: [
                Step(

                    isActive: currentstep == 0,
                    state: currentstep == 0
                        ? StepState.complete
                        : StepState.disabled,

                    title: Text("Step 1",style: TextStyle(color: ColorManger.textcolor),),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            controller: c,
                            validator: (val) {
                              if (c.text.isEmpty) return "please enter your name";
                            },
                            decoration: Methodes.buildInputDecoration(
                                "First Name", "", Icon(Icons.person), null),
                          ),
                        ),
                        Padding(

                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) return "please enter your name";
                            },
                            decoration: Methodes.buildInputDecoration(
                                "Last Name", "", Icon(Icons.person), null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: DropdownButtonFormField(
                            dropdownColor: ColorManger.background,
                              decoration: Methodes.buildInputDecoration(
                                  "Gender",
                                  "",
                                  valueGender == "Male"
                                      ? Icon(Icons.male)
                                      : Icon(Icons.female),
                                  null),
                              value: "",
                              items: ["", "Male", "Female"]
                                  .map((e) => DropdownMenuItem<String>(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  valueGender = val!;
                                });
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) return "please enter your name";
                            },
                            decoration: Methodes.buildInputDecoration(
                                "EMail", "", Icon(Icons.email), null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: TextFormField(
                            controller: controllerdatepicker,
                            readOnly: true,
                            decoration: Methodes.buildInputDecoration(
                                "Date ", "", Icon(Icons.date_range), null),
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: ColorManger.background,
                                          // header background color
                                          onPrimary: ColorManger.textcolor,
                                          // header text color
                                          onSurface: ColorManger
                                              .textcolor, // body text color
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: ColorManger
                                                .textcolor, // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDate: DateTime(2000),
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime.utc(
                                    2003,
                                  )).then((value) => {
                                    controllerdatepicker.text = DateFormat.yMMMd()
                                        .format(value!)
                                        .toString(),
                                  });
                            },
                          ),
                        )
                      ],
                    )),
                Step(
                  isActive: currentstep == 1,
                  state:
                      currentstep == 1 ? StepState.complete : StepState.disabled,
                  title: Text("Step 2"),
                  content: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: TextFormField(
                          validator: (val){
                            if( val!.isEmpty && val.length==0)
                              return "enter correct email";
                          },
                          obscureText: true,
                          decoration: Methodes.buildInputDecoration(
                              "Enter New Password",
                              "8 symbol least",
                              Icon(Icons.lock, color: ColorManger.textcolor),
                              Icon(Icons.password)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextFormField(
                          validator: (v)
                          {

                          },
                          obscureText: true,
                          decoration: Methodes.buildInputDecoration(
                              "Confirm New Password",
                              "8 symbol least",
                              Icon(
                                Icons.lock,
                                color: ColorManger.textcolor,
                              ),
                              null),
                        ),
                      ),
                    ],
                  ),
                ),
                Step(
                  isActive: currentstep == 2,
                  state:
                      currentstep == 2 ? StepState.complete : StepState.disabled,
                  title: Text("Step 3"),
                  content: Column(
                    children: [

                    ],
                  ),
                ),
              ],
              currentStep: currentstep,
            ),
          ),
        ),

        /*Container(
          color: ColorManger.background,
          child: Column(
            children: [
              TextFormField(
                controller: c,
                validator: (val) {
                  if (c.text.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "First Name", "", Icon(Icons.person), null),
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "Last Name", "", Icon(Icons.person), null),
              ),
              DropdownButtonFormField(
                  decoration: Methodes.buildInputDecoration(
                      "Gender",
                      "",
                      valueGender == "Male"
                          ? Icon(Icons.male)
                          : Icon(Icons.female),
                      null),
                  value: "",
                  items: ["", "Male", "Female"]
                      .map((e) => DropdownMenuItem<String>(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      valueGender = val!;
                    });
                  }),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "EMail", "", Icon(Icons.email), null),
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "phone", "", Icon(Icons.phone), null),
              ),
              TextFormField(
                controller: controllerdatepicker,
                readOnly: true,
                decoration: Methodes.buildInputDecoration("Date ", "", Icon(Icons.date_range), null),
                onTap: (){
                  showDatePicker(
                      context: context,
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: ColorManger.background,
                              // header background color
                              onPrimary: ColorManger.textcolor,
                              // header text color
                              onSurface:
                              ColorManger.textcolor, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: ColorManger
                                    .textcolor, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1970),
                      lastDate: DateTime.utc(2003,)
                  ).then((value) => {
                    controllerdatepicker.text = DateFormat.yMMMd().format(value!).toString(),
                  });
                },
              )

            ],
          ),
        ),*/
      ),
    );
  }
}

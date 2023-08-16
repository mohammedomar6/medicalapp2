import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicalapp2/app/toaster.dart';
import 'package:medicalapp2/app/validation.dart';
import 'package:medicalapp2/domin/auth_repository.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/login_pages/cubit/auth_cubit.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';

import '../../mainView/mainview.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  String? accountTypeValue = "Doctor";

  var value = "Anesthesiology";
  var item = [];
  AuthCubit cubit = AuthCubit();
  List<String> list = ["Doctor", "Public"];
  var valueGender = "Male";
  var controllerdatepicker = TextEditingController();
  int currentstep = 0;

  onsteptapped(int val) {
    setState(() {
      currentstep = val;
    });
  }

  onStepCancel() {
    setState(() {
      if (currentstep > 0) currentstep = currentstep - 1;
    });
  }

  onStepContinue() {
    setState(() {
      if (currentstep < 1 && formKey.currentState!.validate()) {
        currentstep = currentstep + 1;
        isactivestep = true;
      } else if (currentstep >= 1) {
        cubit.register(RegisterParams(
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          name: nameController.text,
          accountType: accountTypeValue!,
          birthDate: controllerdatepicker.text,
        ));
      }
    });
  }

  bool isactivestep = false;

  Future<void> readjson() async {
    final String response = await rootBundle.loadString("assets/symptoms.json");
    final dats = await json.decode(response);
    setState(() {
      item = dats["specialties"];
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      readjson();
    });
  }

  var formKey = GlobalKey<FormState>();

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
                    primary: ColorManger.cyen50,
                    background: ColorManger.textcolor,
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
                        margin: const EdgeInsets.all(12),
                        color: ColorManger.textcolor,
                        child: TextButton(
                          onPressed: v.onStepContinue,
                          child: Text(
                            "Continue",
                            style: TextStyle(color: ColorManger.cyen50),
                          ),
                        )),
                    Container(
                        color: ColorManger.textcolor,
                        margin: const EdgeInsets.all(12),
                        child: TextButton(
                            onPressed: v.onStepCancel,
                            child: Text(
                              "Back",
                              style: TextStyle(color: ColorManger.cyen50),
                            ))),
                  ],
                );
              },
              onStepTapped: onsteptapped,
              type: StepperType.horizontal,
              steps: [
                Step(
                    isActive: currentstep == 0,
                    state: currentstep == 0
                        ? StepState.complete
                        : StepState.disabled,
                    title: Text(
                      "Step 1",
                      style: TextStyle(color: ColorManger.cyen50),
                    ),
                    content: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: DropdownButtonFormField<String>(
                                dropdownColor: ColorManger.cyen50,
                                decoration: Methodes.buildInputDecoration(
                                    "Account Type", "", null, null),
                                style: TextStyle(
                                  color: ColorManger.textcolor,
                                  fontSize: 16,
                                ),
                                value: accountTypeValue,
                                items: list
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: (String? val) {
                                  setState(() {
                                    accountTypeValue = val!;
                                  });
                                }),
                          ),
                          if (accountTypeValue == "Doctor")
                            Container(
                              //  height: 75,
                              padding: const EdgeInsets.only(left: 15),

                              child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  dropdownColor: ColorManger.cyen50,
                                  decoration: Methodes.buildInputDecoration(
                                      "Medical specialty", "", null, null),
                                  style: TextStyle(
                                    color: ColorManger.textcolor,
                                    fontSize: 16,
                                  ),
                                  value: value,
                                  items: item
                                      .map((e) => DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                  onChanged: (String? val) {
                                    setState(() {
                                      value = val!;
                                    });
                                  }),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: nameController,
                              validator: (val) {
                                if (val != null && val.length < 3) {
                                  return "please enter your name";
                                }
                                return null;
                              },
                              decoration: Methodes.buildInputDecoration(
                                  "Full Name",
                                  "",
                                  const Icon(Icons.person),
                                  null),
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
                                        ? const Icon(Icons.male)
                                        : const Icon(Icons.female),
                                    null),
                                value: "",
                                items: ["", "Male", "Female"]
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(e),
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
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) =>
                                  val != null && val.isValidEmail()
                                      ? null
                                      : 'Please Add Correct Email',
                              decoration: Methodes.buildInputDecoration(
                                  "EMail", "", const Icon(Icons.email), null),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controllerdatepicker,
                              readOnly: true,
                              decoration: Methodes.buildInputDecoration("Date ",
                                  "", const Icon(Icons.date_range), null),
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
                                      controllerdatepicker.text =
                                          DateFormat.yMMMd()
                                              .format(value!)
                                              .toString(),
                                    });
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                Step(
                  isActive: currentstep == 1,
                  state: currentstep == 1
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text("Step 2"),
                  content: BlocConsumer<AuthCubit, AuthState>(
                    bloc: cubit,
                    listener: (context, state) {
                      if (state.status == AuthStatus.loading) {
                        Toaster.showLoading();
                      } else if (state.status == AuthStatus.success ||
                          state.status == AuthStatus.failed) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                          builder: (context) {
                            return const MainView();
                          },
                        ), (route) => false);
                        Toaster.closeLoading();
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: TextFormField(
                              controller: passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) =>
                                  val != null && val.isValidPassword()
                                      ? null
                                      : 'Please Add Correct Email',
                              obscureText: true,
                              decoration: Methodes.buildInputDecoration(
                                  " Password",
                                  "",
                                  Icon(Icons.lock,
                                      color: ColorManger.textcolor),
                                  const Icon(Icons.password)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (v) {
                                if (v != null && v != passwordController.text) {
                                  return 'Passwords Didn\'t MAtch';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              decoration: Methodes.buildInputDecoration(
                                  "Confirm  Password",
                                  "8 symbol least",
                                  Icon(
                                    Icons.lock,
                                    color: ColorManger.textcolor,
                                  ),
                                  null),
                            ),
                          ),
                        ],
                      );
                    },
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
              TextFormField(  autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: c,
                validator: (val) {
                  if (c.text.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "First Name", "", Icon(Icons.person), null),
              ),
              TextFormField(  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              TextFormField(  autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "EMail", "", Icon(Icons.email), null),
              ),
              TextFormField(  autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val!.isEmpty) return "please enter your name";
                },
                decoration: Methodes.buildInputDecoration(
                    "phone", "", Icon(Icons.phone), null),
              ),
              TextFormField(  autovalidateMode: AutovalidateMode.onUserInteraction,
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

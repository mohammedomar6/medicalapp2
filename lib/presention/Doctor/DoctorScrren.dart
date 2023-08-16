import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../login_pages/login/login_view.dart';
import '../mainView/page/Acount.dart';
import '../mainView/page/ReatsApp.dart';
import '../mainView/page/content medical/medicalconren.dart';
import '../mainView/page/seetting.dart';
import '../mainView/page/thememode.dart';
import '../resource/asset_manger.dart';
import '../resource/color_manger.dart';
import 'appointment.dart';
import 'mypatients.dart';
class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
 List<Widget> peges=[
   Appointment(),
  MedicalContent(),
   MyPatients(),
  ];
  int _currentIndex = 0;

  int currentpage = 0;
  var _pagecontroller = PageController();
  Color? currentColorIcon = ColorManger.cyen50;
  List<Widget> BNBarItem = [
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Icon(
            Icons.home,
            color: ColorManger.textcolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Appointment",
            style: TextStyle(color: ColorManger.textcolor),
          ),
        ),

      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(
            Icons.medical_information,
            color: ColorManger.textcolor,
            weight: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Medical",
            style: TextStyle(color: ColorManger.textcolor),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(

          padding: const EdgeInsets.only(top: 10),
          child: Icon(
            Icons.recent_actors,
            color: ColorManger.textcolor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "MyPatients",
            style: TextStyle(color: ColorManger.textcolor),
          ),
        ),
      ],
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      drawer:  Drawer(
          child:Container(

            color: ColorManger.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: ColorManger.textcolor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 80,),
                      Padding(
                        padding: const EdgeInsets.only(left:12,bottom: 12 ),
                        child: CircleAvatar(
                          backgroundColor: ColorManger.cyen50,
                          radius: 50,
                          child: Image.asset(ImageManger.doctor,color: ColorManger.textcolor,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,bottom: 12),
                        child: Text("Mohammed Omar",style: TextStyle(color: ColorManger.cyen50 ,fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,bottom: 12),
                        child: Text("www.mohammedmae@gmail.com",style: TextStyle(color: ColorManger.cyen50),),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Account()));
                  },
                  title: Text("Account",style: TextStyle(color: ColorManger.textcolor),),
                  leading: Icon(Icons.person,color: ColorManger.textcolor,),
                ),
                ListTile(
                  title: Text("Setting",style: TextStyle(color: ColorManger.textcolor),),
                  leading: Icon(Icons.settings,color: ColorManger.textcolor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Seetting()));
                  },
                ),
                ListTile(
                  title: Text("Theme Mode",style: TextStyle(color: ColorManger.textcolor),),
                  leading: Icon(Icons.dark_mode_outlined,color: ColorManger.textcolor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ThemeModee()));
                  },
                ),

                ListTile(
                  title: Text("Reats App",style: TextStyle(color: ColorManger.textcolor),),
                  leading: Icon(Icons.star_rate_sharp,color: ColorManger.textcolor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReatsApp()));
                  },
                ),
                ListTile(
                  title: Text("Log Out",style: TextStyle(color: ColorManger.textcolor),),
                  leading: Icon(Icons.logout,color: ColorManger.textcolor,),
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Are you sure",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: ColorManger.textcolor),
                            ),
                            backgroundColor: ColorManger.background,
                            surfaceTintColor: ColorManger.cyen50,
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            contentPadding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()),);

                                    });
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: ColorManger.cyen50),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorManger.textcolor))),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          ColorManger.cyen50)),
                                  onPressed: () {
                                    setState(() {

                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    "No",
                                    style:
                                    TextStyle(color: ColorManger.textcolor),
                                  )),
                            ],
                          );
                        });
                  },

                ),

              ],
            ),
          )


      ),

      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: ColorManger.cyen50,

        //     letIndexChange:(indx)=>true ,

        color: ColorManger.cyen50,
        //WS    animationDuration: Duration(seconds: 1),
        animationCurve: Curves.easeInOutCubic,
        backgroundColor: ColorManger.background,

        index: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pagecontroller.jumpToPage(index);
          });
        },
        items: BNBarItem,
      ),
 body: Container(
   color:  ColorManger.background,
   child: PageView(

     controller: _pagecontroller,
     children: peges,
     onPageChanged: (select_page) {
       setState(() {
         _currentIndex = select_page;
       });
     },
   ),
 ),
    );
  }
}

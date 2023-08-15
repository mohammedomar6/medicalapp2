import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/login/login_view.dart';
import 'package:medicalapp2/presention/mainView/page/Home.dart';
import 'package:medicalapp2/presention/mainView/page/thememode.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';

import 'page/Acount.dart';
import 'page/ReatsApp.dart';
import 'page/record/record.dart';
import 'page/content medical/medicalconren.dart';
import 'page/medical_visits/setting.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    Home(),
    MedicalContent(),
    Record(),
    Setting(),
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
            "Home",
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
            "Record",
            style: TextStyle(color: ColorManger.textcolor),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Icon(Icons.settings, color: ColorManger.textcolor),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "More",
            style: TextStyle(color: ColorManger.textcolor),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
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
      backgroundColor: ColorManger.background,
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

      /* appBar: AppBar(
        backgroundColor: ColorManger.background,
        title: const Text(
          "Medical App",
        ),
        centerTitle: true,
      ),
      drawer: SafeArea(
        child: Drawer(
          surfaceTintColor: ColorManger.white,
          backgroundColor: ColorManger.white,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: ColorManger.background,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Icon(Icons.face_5,
                            size: 70, color: ColorManger.textcolor, grade: 25),
                      ),
                      Text("Medical App"),
                    ],
                  )
                ],
              ),
              ListTile(
                tileColor: ColorManger.white,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (c) {
                        return AlertDialog(
                          elevation: 20,
                          shadowColor: ColorManger.background,
                          surfaceTintColor: Colors.deepOrange,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50)),
                          ),
                          backgroundColor: ColorManger.background,
                          title: Text("are you logout "),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.loginRoutes);
                                  },
                                  child: Text("yes")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(c);
                                  },
                                  child: Text("No")),
                            ],
                          ),
                        );
                      });
                },
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorManger.textcolor),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                title: Text("Log out"),
                leading: Icon(Icons.settings),
              ),
            ],
          ),
        ),
    )*/
      body: PageView(
        controller: _pagecontroller,
        children: pages,
        onPageChanged: (select_page) {
          setState(() {
            _currentIndex = select_page;
          });
        },
      ),
    );
  }
}
/*



 BottomNavigationBar(
           selectedItemColor: Colors.black,
        items: BNBarItem,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

        },
        type: BottomNavigationBarType.shifting,
      ),
 */

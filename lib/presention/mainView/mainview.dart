import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicalapp2/methodes.dart';
import 'package:medicalapp2/presention/mainView/page/Home.dart';
import 'package:medicalapp2/presention/resource/asset_manger.dart';
import 'package:medicalapp2/presention/resource/color_manger.dart';
import 'package:medicalapp2/presention/resource/routes_manger.dart';

import 'page/record/record.dart';
import 'page/content medical/medicalconren.dart';
import 'page/setting.dart';

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
    Container(
      child: Column(
        children: [
          Icon(
            Icons.home,
            color: ColorManger.textcolor,
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
    ),
    Column(
      children: [
        Icon(
          Icons.medical_information,
          color: ColorManger.textcolor,
          weight: 5,
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
        Icon(
          Icons.recent_actors,
          color: ColorManger.textcolor,
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
        Icon(Icons.settings, color: ColorManger.textcolor),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Setting",
            style: TextStyle(color: ColorManger.textcolor),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/pages/Ajout_Mont_Bottomsheet.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';
import 'pages/acceuil.dart';
import 'pages/chat.dart';
import 'pages/notifecation.dart';
import 'pages/project.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const myacceuil(),
    const Project(),
    const Chat(),
    NotificationPage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = myacceuil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,

      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: SizedBox(
        width: 54,
        height: 54,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40.0),
                ),
              ),
              builder: (context) => const SingleChildScrollView(
                child: MyBottomSheet(),
              ),
            );
          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor: AppColors.primary,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),


        ),
        child: BottomAppBar(
              color: AppColors.primary,
              shape: CircularNotchedRectangle(),
              notchMargin: 3.0,
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = myacceuil();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home_outlined,
                                size: 34.0,
                                color: currentTab == 0
                                    ? Colors.white60
                                    : Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 29.0,
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Project();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.business,
                                size: 30.0,
                                color: currentTab == 1
                                    ? Colors.white60
                                    : Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    //RIGHT TAB ICONS
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Chat();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat,
                                size: 34.0,
                                color: currentTab == 2
                                    ? Colors.white60
                                    : Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 29.0,
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = NotificationPage();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                size: 30.0,
                                color: currentTab == 3
                                    ? Colors.white60
                                    : Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),

    );
  }
}

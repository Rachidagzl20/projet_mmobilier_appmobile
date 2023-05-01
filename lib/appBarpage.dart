
import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return   AppBar(
    leading: Padding(
    padding: const EdgeInsets.only(left: 10.0),
    child: Image.asset('assets/logo.png'),
    ),

    backgroundColor: AppColors.primary,
    actions: [
    IconButton(onPressed: (){},
    icon: Icon(Icons.search_rounded)),
    IconButton(onPressed: (){},  icon: Icon(Icons.notifications_active)),
    IconButton(onPressed: (){}, icon: Icon(Icons.logout_outlined))
    ],

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

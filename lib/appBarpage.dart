import 'package:flutter/material.dart';
import 'package:projet_mmobilier_appmobile/pages/login.dart';

import 'pages/profil.dart';
import 'package:projet_mmobilier_appmobile/utils/app_color.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false, // Add this line to remove the back button icon
      leading: _buildLeading(),
      actions: _buildActions(),
    );

  }

  Widget? _buildLeading() {
    if (_isSearching) {
      return null; // Return null to hide the logo
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset('assets/logo.png'),
      );
    }
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return [
        Expanded(

          child: Padding(

            padding: const EdgeInsets.fromLTRB(50.0, 0, 8.0, 0),
            child: TextField(
              cursorColor: Colors.white,
              cursorHeight: 27,
              controller: _searchController,
              autofocus: true,
              style: const TextStyle(
                color: Colors.white, // Set search text color to white
              ),
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize:16// Change hint text color here
                ),

              ),
              onSubmitted: (value) {
                // Perform search action here
                print('Search query: $value');
              },
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () async {



            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profil( )),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ];
    }
  }
}

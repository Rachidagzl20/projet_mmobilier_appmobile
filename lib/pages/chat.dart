import '../appBarpage.dart';
import 'package:flutter/material.dart';

import 'contactchatClient.dart';

class Admin {
  final String name;
  final String image;
  final String lastMessage;
  final String date;

  Admin({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.date,
  });
}
class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<Admin> admins = [
    Admin(
      name: "rachida guezoul",
      image: "assets/profile_img.png",
      lastMessage: "Hello!",
      date: "May 27",
    ),
    Admin(
      name: "khadija guezoul",
      image: "assets/profile_img.png",
      lastMessage: "Hi there!",
      date: "May 25",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView.separated(
          itemCount: admins.length,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey,
            height: 0.5,
          ),

          itemBuilder: (context, index) {
            final admin = admins[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(admin.image),
                  radius: 30, // Adjust the size as needed
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    admin.name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(admin.lastMessage),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          admin.date,
                          style: const TextStyle(fontSize: 12,
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => contacterClient(
                        adminName: admin.name,
                        adminImage: admin.image,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      appBar: const MyAppBar(),
    );
  }
}


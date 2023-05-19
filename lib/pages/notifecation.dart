import 'package:flutter/material.dart';
import '../appBarpage.dart';


class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(49.0, 20, 0, 0),
              child: Text(
                'Notification',

                style: TextStyle(fontWeight: FontWeight.bold
                ,
                fontSize: 23),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 49.0, top: 5.0),
              child: Text(
                'Vous avez 3 notifications aujourd\'hui',
                style: TextStyle(fontSize: 15.0),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0,top: 20),
              child: Text(
                'Aujourd\'hui',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            NotificationItem(
              image: AssetImage('assets/profile_1.png'),
              name: 'John Doe',
              functionality: 'User-Commercial',
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              time: '5 min',
            ),
            NotificationItem(
              image: AssetImage('assets/profile_2.jpeg'),
              name: 'Jane Smith',
              functionality: 'User-Manager',
              description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              time: '2h',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Text(
                'Hier',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            NotificationItem(
              image: AssetImage('assets/profile_1.png'),
              name: 'Bob Johnson',
              functionality: 'User-Designer',
              description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              time: '12 Mai',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final ImageProvider<Object> image;
  final String name;
  final String functionality;
  final String description;
  final String time;

  NotificationItem({
    required this.image,
    required this.name,
    required this.functionality,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: image,
        ),
        title: Text('$name - $functionality'),
        subtitle: Text(description),
        trailing: Text(time),
      ),
    );
  }
}


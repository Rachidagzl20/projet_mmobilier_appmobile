import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> admins = [
    Contact(
      name: 'Admin 1',
      lastMessage: 'Hello!',
      avatarUrl: 'https://example.com/avatar1.png',
    ),
    Contact(
      name: 'Admin 2',
      lastMessage: 'Welcome!',
      avatarUrl: 'https://example.com/avatar2.png',
    ),
    Contact(
      name: 'Admin 3',
      lastMessage: 'How can I help?',
      avatarUrl: 'https://example.com/avatar3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: admins.length,
        itemBuilder: (context, index) {
          Contact admin = admins[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(admin.avatarUrl),
            ),
            title: Text(admin.name),
            subtitle: Text(admin.lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat(admin: admin),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String lastMessage;
  final String avatarUrl;

  Contact({
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
  });
}

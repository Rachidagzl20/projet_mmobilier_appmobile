import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class contacterClient extends StatefulWidget {
  final String adminName;
  final String adminImage;

  contacterClient({Key? key, required this.adminName, required this.adminImage})
      : super(key: key);

  @override
  _contacterClientState createState() => _contacterClientState();
}

class _contacterClientState extends State<contacterClient> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];

  void sendMessage() {
    final message = _textEditingController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.insert(0, message); // Insert message at the beginning
      });
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.adminImage),
            ),
            const SizedBox(width: 8),
            Text(widget.adminName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Start from bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



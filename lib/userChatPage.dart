import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [
    {"text": "Can you fix this", "isMe": true, "time": "10.45"},
    {"text": "Yes", "isMe": false, "time": "10.46"},
  ];

  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "text": _controller.text,
        "isMe": true,
        "time": TimeOfDay.now().format(context),
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.indigo),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),

        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person,color: Colors.white),
            ),
            const SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Saman",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text("Online",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.phone_outlined, color: Colors.indigo[900]),
            ),
          )
        ],
      ),

      body: Column(
        children: [

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Chip(
              label: Text("Today",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.indigoAccent,
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {

                var msg = messages[index];

                return _buildMessageBubble(
                  msg["text"],
                  msg["isMe"],
                  msg["time"],
                );
              },
            ),
          ),

          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isMe, String time) {
    return Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [

        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          decoration: BoxDecoration(
            color: isMe ? Colors.white : const Color(0xFF283593),

            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: Radius.circular(isMe ? 20 : 0),
              bottomRight: Radius.circular(isMe ? 0 : 20),
            ),
          ),

          child: Text(
            text,
            style: TextStyle(
              color: isMe ? Colors.black87 : Colors.white,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            time,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,

      child: Row(
        children: [

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4FF),
                borderRadius: BorderRadius.circular(30),
              ),

              child: TextField(
                controller: _controller,

                decoration: const InputDecoration(
                  hintText: "Say something",
                  prefixIcon: Icon(Icons.camera_alt_outlined,
                      color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFF283593),

            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: sendMessage,
            ),
          )
        ],
      ),
    );
  }
}
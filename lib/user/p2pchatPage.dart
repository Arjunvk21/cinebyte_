import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  final String userName;

  const ChatPage({required this.userId, required this.userName, Key? key})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String currentUserId;

  @override
  void initState() {
    super.initState();
    currentUserId = auth.currentUser!.uid;
  }

  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    await FirebaseFirestore.instance.collection('chats').add({
      'senderId': currentUserId,
      'receiverId': widget.userId,
      'message': message,
      'timestamp': Timestamp.now(),
    });

    messageController.clear();
  }

  Stream<List<QueryDocumentSnapshot>> getChatMessages() {
    return FirebaseFirestore.instance
        .collection('chats')
        .where('senderId', isEqualTo: currentUserId)
        .where('receiverId', isEqualTo: widget.userId)
        .snapshots()
        .map((query) => query.docs)
        .asyncMap((sentMessages) async {
      var receivedMessages = await FirebaseFirestore.instance
          .collection('chats')
          .where('senderId', isEqualTo: widget.userId)
          .where('receiverId', isEqualTo: currentUserId)
          .get();
      return [...sentMessages, ...receivedMessages.docs];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(title: widget.userName),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<QueryDocumentSnapshot>>(
              stream: getChatMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var messages = snapshot.data!;
                messages
                    .sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    bool isMe = message['senderId'] == currentUserId;
                    return ListTile(
                      title: Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isMe
                                ? textcolor
                                : Color.fromARGB(255, 247, 247, 246),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message['message'],
                            style: GoogleFonts.fugazOne(
                                color: const Color.fromARGB(255, 33, 33, 33)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [   
                Expanded(
                  child: TextField(
                    cursorColor: textcolor,
                    style: GoogleFonts.fugazOne(color: textcolor),
                    controller: messageController,
                    decoration: InputDecoration(
                      focusColor: textcolor,
                      hintText: 'Type a message...',
                      hintStyle: GoogleFonts.fugazOne(color: textcolor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: textcolor,
                  ),
                  onPressed: () => sendMessage(messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

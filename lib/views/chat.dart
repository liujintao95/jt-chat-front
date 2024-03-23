import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageEditingController = TextEditingController();
  List<Widget> messages = [];

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      setState(() {
        messages.add(
          MessageTile(
            message: messageEditingController.text,
            date: DateFormat("MM-dd HH:mm").format(DateTime.now()),
            sendByMe: "123" == "123",
          )
        );
        
        messageEditingController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("对方姓名"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return messages[index];
            }
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              color: const Color(0x54FFFFFF),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: messageEditingController,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                        hintText: "Message ...",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: InputBorder.none),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      addMessage();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0x36FFFFFF), Color(0x0FFFFFFF)],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight),
                          borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(Icons.send),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final String date;
  final bool sendByMe;

  const MessageTile({super.key, required this.message, required this.date, required this.sendByMe});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(date, textAlign: TextAlign.left,),
        ),
        Container(
          padding: EdgeInsets.only(
              top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
          alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: sendByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 30),
            padding:
                const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: sendByMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomRight: Radius.circular(23)),
                gradient: LinearGradient(
                  colors: sendByMe
                      ? [const Color.fromRGBO(149,236,105,1), const Color.fromRGBO(149,236,105,1)]
                      : [const Color.fromRGBO(230,230,230,1), const Color.fromRGBO(230,230,230,1)],
                )),
            child: Text(message,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color.fromARGB(255, 15, 15, 15),
                fontSize: 16,
              )
            ),
          ),
        )
      ],
    );
  }
}

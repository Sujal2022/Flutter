import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:module_6_assignment/components/my_textfields.dart';
import 'package:module_6_assignment/services/auth/auth_service.dart';
import 'package:module_6_assignment/services/chat/chat_service.dart';

import '../components/chat_bubble.dart';

class ChatPages extends StatefulWidget
{
  final String receiverEmail;
  final String receiverID;

   ChatPages({super.key,
    required this.receiverEmail,
     required this.receiverID
  });

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    //super.initState();

    myFocusNode.addListener(()
    {
      if(myFocusNode.hasFocus)
        {
          Future.delayed(Duration(milliseconds: 500), () => ScrollDown(),);
        }
    });
    
    Future.delayed(const Duration(milliseconds: 500),() => ScrollDown
    );
  }
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    myFocusNode.dispose();
    _messageController.dispose();
  }

  void sendMessage() async
  {
    //if there is something inside the textfields
    if(_messageController.text.isNotEmpty)
      {
        //send message
        await _chatService.sendMessage(widget.receiverID, _messageController.text);

        // clear text controller
        _messageController.clear();
      }
  }

  final ScrollController _scrollController = ScrollController();

  void ScrollDown()
  {
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(

        children: [
          Expanded(child: _buildMessageList(),
          ),

          //user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList()
  {
    String senderID = _authService.getCurrentUser()!.uid;

    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot)
        {
          //error
          if(snapshot.hasError)
            {
              return Text("Error");
            }
          //loading
          if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Text("Loading.....");
            }

          //return list view
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );

        }
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc)
  {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    //align message to right if sender is the current user, otherwise left
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,

        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(
              message: data["message"],
              isCurrentUser: isCurrentUser,
            ),
          ],
        ));

  }

  //build message input
  Widget _buildUserInput()
  {
    return Padding(
      padding: const EdgeInsets.only(bottom:50.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextFields(
                controller: _messageController,
                hintext: "Type a message",
                obscureText: false,
                focusnode: myFocusNode,
              )),
          //send button
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
            margin: EdgeInsets.only(right: 25),
            child: IconButton(onPressed: sendMessage,
                icon: Icon(Icons.arrow_upward,color: Colors.white,)
            ),
          ),

        ],

      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubae/screens/view/constants.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}


class MyDivider extends Divider implements PreferredSizeWidget {
  MyDivider({
    Key key,
    height = 16.0,
    indent = 0.0,
    color,
  })  : assert(height >= 0.0),
        super(
        key: key,
        height: height,
        indent: indent,
        color: color,
      ) {
    preferredSize = Size(double.infinity, height);
  }

  @override
  Size preferredSize;
}

class _ChatPageState extends State<ChatPage> {


  List _chats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getChats();
  }

  _getChats(){

    //ToDo: Fetch chats for the backend
    _chats = [
      {
        "name": "Amy WhiteField",
        "userId": "fjadkdjkafdjf",
        "lastMessage": "Nice Meeting you"
      },
      {
        "name": "John Doe",
        "userId": "fjadkdjkafdjf",
        "lastMessage": "You're really nice"
      },
      {
        "name": "Amy WhiteField",
        "userId": "fjadkdjkafdjf",
        "lastMessage": "Your really nice"
      },
      {
        "name": "Amy WhiteField",
        "userId": "fjadkdjkafdjf",
        "lastMessage": "Your really nice"
      },
      {
        "name": "Amy WhiteField",
        "userId": "fjadkdjkafdjf",
        "lastMessage": "Your really nice"
      },
    ];

    setState(() {
    });

  }


  @override
  Widget build(BuildContext context) {

    final height = getHeight(context);
    final width = getWidth(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Chats"),
        bottom: MyDivider(color: Colors.white,),
      ),

      backgroundColor: Colors.black,
      body: Container(
        height: height,
        width: width,
        child: ListView.separated(
          itemBuilder: (context,ind)=> ListTile(
            onTap: ()=> Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> MessagePage(_chats[ind]["name"]))),
            leading: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Icon(Icons.person,color: Colors.orange,)
            ),
            title: Text("${_chats[ind]["name"]}",style: loginTextStyle.apply(color: Colors.orange),),
            subtitle: Text("${_chats[ind]["lastMessage"]}",style: cardLocationStyle.apply(color: Colors.white),),
          ),
          itemCount: _chats.length,
          separatorBuilder: (context,ind)=> Divider(color: Colors.white,),
        ),

      )
    );
  }
}


class MessagePage extends StatefulWidget {

  String chatName;
  MessagePage(this.chatName);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  String _chatName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatName = widget.chatName;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("$_chatName"),
      ),
    );
  }
}


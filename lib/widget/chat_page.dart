import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthcare/widget/cardlist.dart';
import 'package:healthcare/widget/category_page.dart';
import 'package:healthcare/widget/transition.dart';
import 'package:image_picker/image_picker.dart';

//TCP SOCKET
import 'package:async/async.dart';
// import 'package:flutter_socket_io/socket_io_manager.dart';
// import 'package:flutter_socket_io/flutter_socket_io.dart';

class Chat extends StatefulWidget {
  const Chat({Key key, this.name, this.image, this.status}) : super(key: key);

  final String name;
  final String image;
  final String status;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ScrollController _scrollController = new ScrollController();

  var chatMessages = List<ChatData>();
  int _viewTypeMessage = -1;
  var _messageTextEditingController = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  Future takeImage(ImageSource source) async {
    //always show the most recent messages
    Future.delayed(
        Duration(seconds: 5),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));

    File image = await ImagePicker.pickImage(source: source);

    setState(() {
      _messageTextEditingController.clear();
      chatMessages.add(ChatData(image.path, 2, 2));
    });
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, SlideRightRoute(page: CategoryPage()));
            },
          ),
        ),
        title: Row(
          children: <Widget>[
            Container(
              height: 46.0,
              width: 46.0,
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.status,
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: false,
                    reverse: false, // urutan chat atas ke bawah
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      ChatData chatMessage = chatMessages[index];
                      return _buildMessageRows(chatMessage, screenWidth);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _messageTextEditingController,
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: new Icon(
                          Icons.image,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          takeImage(ImageSource.gallery);
                        },
                        color: Colors.amberAccent,
                      ),
                      IconButton(
                        icon: new Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          takeImage(ImageSource.camera);
                        },
                        color: Colors.amberAccent,
                      ),
                      IconButton(
                        icon: new Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(
                              new FocusNode()); //hide keyboard after send data
                          sendMessage();
                        },
                        color: Colors.amberAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendMessage() {
    var message = _messageTextEditingController.text.trim();

    if (message != '') {
      setState(() {
        _messageTextEditingController.clear();
        chatMessages.add(ChatData(message, 2, 1));
      });

      _scrollController.jumpTo(_scrollController
          .position.maxScrollExtent); //always show the most recent messages

      sendMessageToServer();
    }
  }

  sendMessageToServer() {
    //TODO: sendMessageToServer
  }

  Widget _buildMessageRows(ChatData chatMessage, double screenWidth) {
//  _viewType = 1 -> received message, _viewType = 2 -> sent message
// _messageType = 1 -> text, _messageType = 2 -> image

    Row newRow;

    switch (chatMessage._viewType) {
      case 1:
        switch (chatMessage._messageType) {
          case 1:
            newRow = Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //max width of the text is 60% of screen width
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.6),
                      child: Text(
                        chatMessage._message,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
            break;

          case 2:
            newRow = Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File(chatMessage._message),
                      //width of the image is 40% of screen width
                      width: screenWidth * 0.4,
                    ),
                  ),
                ),
              ],
            );
            break;
        }
        break;

      case 2:
        switch (chatMessage._messageType) {
          case 1:
            newRow = Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      //max width of the text is 60% of screen width
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.6),
                      child: Text(chatMessage._message),
                    ),
                  ),
                ),
              ],
            );
            break;

          case 2:
            newRow = new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: previewImage(chatMessage._message),
                        child: Image.file(
                          File(chatMessage._message),
                          //width of the image is 40% of screen width
                          width: screenWidth * 0.4,
                        ),
                      )),
                ),
              ],
            );
            break;
        }
    }
    return newRow;
  }

  previewImage(String imagepath) {
//    return Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => PreviewImage(imagePath: imagepath),
//      ),
//    );
  }
}

class PreviewImage extends StatelessWidget {
  final String imagePath;

  PreviewImage({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Image.file(
              File(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}

class ChatData {
  String _message;
  int _viewType; // _viewType = 1 -> received message, _viewType = 2 -> sent message
  int _messageType; // _messageType = 1 -> text, _messageType = 2 -> image

  ChatData(this._message, this._viewType, this._messageType);

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  int get viewType => _viewType;

  set viewType(int value) {
    _viewType = value;
  }

  int get messageType => _messageType;

  set messageType(int value) {
    _messageType = value;
  }
}

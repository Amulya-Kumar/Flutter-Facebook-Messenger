import 'package:flutter/material.dart';
import 'package:flutter_messenger/screens/chats.dart';
import 'package:flutter_messenger/screens/new_message.dart';

class MessengerHome extends StatefulWidget {
  @override
  _MessengerHomeState createState() => _MessengerHomeState();
}

class _MessengerHomeState extends State<MessengerHome> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    ChatsScreen(),
    Center(child: Container(child: Text('People'),)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 2.0, 10.0),
          child: CircleAvatar(
            foregroundColor: Theme.of(context).primaryColorDark,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
                "https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
          ),
        ),
        title: Text(
          _currentIndex == 0 ? "Chats" : "People",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
        elevation: 0.5,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              if (_currentIndex == 0) {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => null,
                  ),
                );
              }
              return null;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
                child: Icon(
                  _currentIndex == 0 ? Icons.camera_alt : Icons.contacts,
                  size: 20.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_currentIndex == 0) {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewMessage(),
                  ),
                );
              }
              return null;
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
                child: Icon(
                  _currentIndex == 0 ? Icons.edit : Icons.person_add,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).primaryColorDark,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            title: Text("Chats"),
            icon: Icon(Icons.chat_bubble),
          ),
          BottomNavigationBarItem(
            title: Text("People"),
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}

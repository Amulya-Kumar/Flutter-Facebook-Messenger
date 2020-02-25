import 'package:flutter/material.dart';
import 'package:flutter_messenger/models/contacts_model.dart';
import 'package:flutter_messenger/screens/messenger_home.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

List<bool> selectList = List<bool>.filled(contactData.length, false);
bool _isSwitched = false;

class _NewMessageState extends State<NewMessage> {

  @override
  void initState(){
    super.initState();
    selectList = List<bool>.filled(contactData.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Choose Friends",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
        ),
        actions: <Widget>[
          selectList.contains(true) ? Center(child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 20.0),
            child: Text("OK", style: TextStyle(fontSize: 16.0),),
          )) : Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: 50.0,
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Search",
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: selectList.contains(true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: selectList
                      .asMap()
                      .map((i, item) => MapEntry(
                          i,
                          item == true
                              ? Padding(
                                padding: const EdgeInsets.only(right: 10.0, left: 5.0),
                                child: Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 28.0,
                                        backgroundImage: NetworkImage(
                                            contactData[i].avatarUrl),
                                      ),
                                      Positioned(
                                        right: 0.0,
                                        child: CircleAvatar(
                                          child: Icon(Icons.close, size: 16.0,),
                                          radius: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                              )
                              : SizedBox()))
                      .values
                      .toList(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(contactData[index].avatarUrl),
                  ),
                  title: Text(contactData[index].name),
                  trailing: Visibility(
                    visible: !_isSwitched,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectList[index] = !selectList[index];
                        });
                      },
                      child: Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectList[index]
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: selectList[index]
                            ? Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 20.0,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.transparent,
                              ),
                      ),
                    ),
                  ),
                ),
                itemCount: contactData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

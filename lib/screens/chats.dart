import 'package:flutter/material.dart';
import 'package:flutter_messenger/models/chats_model.dart';
import 'package:flutter_messenger/models/stories_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController;
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: 50.0,
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
                child: GestureDetector(
                  onTap: () {
                    //showSearch(context: context, delegate: (){});
                  },
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
            Container(
              height: 90.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyData == null ? 1 : storyData.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white24,
                            ),
                            child: Icon(Icons.add, size: 35.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Your Story',
                              softWrap: true,
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  index -= 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        storyData[index].isOnline
                            ? Container(
                                padding: EdgeInsets.only(bottom: 6.0, top: 1.0),
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 28.0,
                                      backgroundImage: NetworkImage(
                                          storyData[index].avatarUrl),
                                    ),
                                    Positioned(
                                      bottom: 0.0,
                                      right: 0.0,
                                      child: CircleAvatar(
                                        radius: 10.0,
                                        backgroundColor:
                                            Theme.of(context).primaryColorDark,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 6.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(bottom: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.lightBlue,
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 27.0,
                                  backgroundColor: Colors.transparent,
                                  child: CircleAvatar(
                                    radius: 24.0,
                                    backgroundImage: NetworkImage(
                                        storyData[index].avatarUrl),
                                  ),
                                ),
                              ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  storyData[index].name,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: chatData.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.15,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              NetworkImage(chatData[index].avatarUrl),
                        ),
                        title: Container(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            chatData[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              chatData[index].message,
                              style: TextStyle(color: Colors.grey, fontSize: 15.0),
                            ),
                            Text(
                              chatData[index].time,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.call),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.videocam),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                      secondaryActions: <Widget>[
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.menu),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.redAccent,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                              iconSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}

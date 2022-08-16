import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_Item.dart';
import 'list_Item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedChannel = 'Tixio 2.0';
  TextStyle myStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.teal,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          FontAwesomeIcons.bars,
          color: Colors.black,
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('images/person1.jpeg'),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 20,
                ),
                child: Text(
                  'Wiki Lists',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 250,
                child: GridView.count(
                  primary: true,
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                    top: 10,
                  ),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                  children: <Widget>[
                    ReusableCard(
                      backGroundColor: Colors.teal[900],
                      iconType: FontAwesomeIcons.listCheck,
                      cardText: 'all wikis',
                    ),
                    ReusableCard(
                      backGroundColor: Colors.teal[700],
                      iconType: FontAwesomeIcons.lock,
                      cardText: 'my private notes',
                    ),
                    ReusableCard(
                      backGroundColor: Colors.teal[500],
                      iconType: FontAwesomeIcons.bookBookmark,
                      cardText: 'bookmarked wikis',
                    ),
                    ReusableCard(
                      backGroundColor: Colors.teal[200],
                      iconType: FontAwesomeIcons.pager,
                      cardText: 'templates',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 20,
                ),
                child: Text(
                  'Recently Opened Wikis',
                  style: myStyle,
                ),
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return listItem(
                        listText: 'Brand Guidline',
                      );
                    } else if (index == 1) {
                      return listItem(
                        listText: 'Project Grail Sprint Plane',
                      );
                    } else {
                      return listItem(
                        listText: 'Personal Wiki',
                      );
                    }
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 20,
                    ),
                    child: Text(
                      'Channels/ Groups',
                      style: myStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.teal,
                          width: 3,
                          style: BorderStyle.solid,
                        ),
                      ),
                      width: 30,
                      height: 30,
                      child: Icon(
                        FontAwesomeIcons.add,
                        size: 20,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return
                          //   buildRadioButtenItem(selectedChannel ,onChangeMethod((value) {
                          //   setState(() {
                          //     selectedChannelVal = value!;
                          //   });
                          // })  );
                          ListTile(
                        leading: Radio<String>(
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.teal,
                          ),
                          value: 'Project Grail',
                          groupValue: selectedChannel,
                          onChanged: (value) {
                            setState(() {
                              selectedChannel = value!;
                            });
                          },
                        ),
                        title: Text(
                          'Project Grail',
                        ),
                        trailing: Icon(FontAwesomeIcons.circleInfo),
                      );
                    } else if (index == 1) {
                      return ListTile(
                        leading: Radio<String>(
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.teal,
                          ),
                          value: 'Tixio 2.0',
                          groupValue: selectedChannel,
                          onChanged: (value) {
                            setState(() {
                              selectedChannel = value!;
                            });
                          },
                        ),
                        title: Text(
                          'Tixio 2.0',
                        ),
                        trailing: Icon(FontAwesomeIcons.circleInfo),
                      );
                    } else {
                      return ListTile(
                        leading: Radio<String>(
                          fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.teal,
                          ),
                          value: 'Other Data Group',
                          groupValue: selectedChannel,
                          onChanged: (value) {
                            setState(() {
                              selectedChannel = value!;
                            });
                          },
                        ),
                        title: Text(
                          'Other Data Group',
                        ),
                        trailing: Icon(FontAwesomeIcons.circleInfo),
                      );
                    }
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(FontAwesomeIcons.add),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
        ],
        selectedItemColor: Colors.teal,
        onTap: homeSelected(),
      ),
    );
  }
}

// Widget buildRadioButtenItem(
//   selectedChannelVal,
//     Function() onChangeMethod
// ) {
//   return ListTile(
//     leading: Radio<String>(
//       value: 'Project Grail',
//       groupValue: selectedChannelVal,
//       onChanged:onChangeMethod(),
//     ),
//     title: Text(
//       'Project Grail',
//       // textScaleFactor: 1.5,
//     ),
//     trailing: Icon(FontAwesomeIcons.circleInfo),
//   );
// }

//Navigation Methode==>
homeSelected() {
  print('Home Selected');
}
// Colors.teal[900]
// #FF8965 pinky Color
// #68F1AD blue Color
// #7885CB purpil color
// #69F0AE Green Color

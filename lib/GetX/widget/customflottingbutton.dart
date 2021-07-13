
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/GetX/views/adddetails.dart';
import 'package:flutter_state_management/GetX/views/homepage.dart';

class FlotingButton extends StatelessWidget {
  const FlotingButton({
    Key? key,
    required this.title,
    required this.scrollDirection,
  }) : super(key: key);

  final String title;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: new Icon(Icons.group_add),
                    title: new Text('Add Person'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddData(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.share),
                    title: new Text('share'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewDetails(
                              title: title, scrollDirection: scrollDirection),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: new Icon(Icons.screen_rotation),
                    title: new Text('Orrientation Change'),
                    onTap: () {
                      if (scrollDirection == Axis.horizontal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewDetails(
                                title: title, scrollDirection: Axis.vertical),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewDetails(
                                title: title,
                                scrollDirection: Axis.horizontal),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.bookmarks_outlined),
      backgroundColor: Colors.blueGrey,
    );
  }
}
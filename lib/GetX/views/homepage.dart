import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/GetX/controller/getxcontroller.dart';
import 'package:flutter_state_management/GetX/views/updatedata.dart';
import 'package:flutter_state_management/GetX/widget/customappbar.dart';
import 'package:flutter_state_management/GetX/widget/customflottingbutton.dart';
import 'package:flutter_state_management/GetX/widget/customtext.dart';
import 'package:get/get.dart';

import 'adddetails.dart';

class ViewDetails extends GetView<DataController> {
  final String title;
  final Axis scrollDirection;
  final DataController dataController = Get.put(DataController());
  List list = Get.find<DataController>().list;
  ViewDetails({Key? key, required this.title, required this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Obx(
        () {
          if (list.isNotEmpty) {
            if (scrollDirection == Axis.horizontal)
              return horizontalListView(context);
            else
              return verticalListView();
          } else
            return Center(child: Text('Please add data !!!'));
        },
      ),
      floatingActionButton: FlotingButton(title: title, scrollDirection: scrollDirection),
    );
  }

  ListView verticalListView() {
    return ListView.separated(
      separatorBuilder: (context, position) => SizedBox(
        height: 10.0,
      ),
      scrollDirection: scrollDirection,
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, position) {
        return ListTile(
            leading: Text('${list[position].id}'),
            title: Text('${list[position].name}'),
            subtitle: Text('${list[position].title}'),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: new Icon(Icons.delete),
                          title: new Text('Delete'),
                          onTap: () {
                            controller.deleteData(position);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: new Icon(Icons.edit),
                          title: new Text('Update'),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateData(id: position),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  });
            });
      },
    );
  }

  Row horizontalListView(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.separated(
              separatorBuilder: (context, position) => SizedBox(
                height: 10.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Card(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          CustomText(
                            text: '${list[position].id}',
                            padding: 10,maxLines: 2,
                            alignment: MainAxisAlignment.center,
                          ),
                          CustomText(
                            text: '${list[position].name}',
                            padding: 10,maxLines: 2,
                            alignment: MainAxisAlignment.center,
                          ),
                          CustomText(
                            text: '${list[position].title}',
                            padding: 10,maxLines: 2,
                            alignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: new Icon(Icons.delete),
                              title: new Text('Delete'),
                              onTap: () {
                                controller.deleteData(position);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: new Icon(Icons.edit),
                              title: new Text('Update'),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateData(id: position),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      });
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}



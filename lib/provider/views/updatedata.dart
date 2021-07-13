import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/model/datamodel.dart';
import 'package:flutter_state_management/provider/notifiers/itemaddnotifier.dart';
import 'package:flutter_state_management/provider/widget/customappbar.dart';
import 'package:flutter_state_management/provider/widget/custombutton.dart';
import 'package:flutter_state_management/provider/widget/customtext.dart';
import 'package:flutter_state_management/provider/widget/customtextfield.dart';
import 'package:provider/provider.dart';

class UpdateDataPage extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int position;
  int? id;
  UpdateDataPage({required this.position});
  void setText(BuildContext context) {
    id =  Provider.of<ItemAddNotifier>(context, listen: false).itemList[position].id;
    namecontroller.text = Provider.of<ItemAddNotifier>(context, listen: false).itemList[position].name;
    descriptionController.text =Provider.of<ItemAddNotifier>(context, listen: false).itemList[position].title;
  }

  @override
  Widget build(BuildContext context) {
    setText(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: 'GetX App',
        ),
        body:  Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CommonTextField(
                hintText: 'User Name',
                textEditingController: namecontroller,
                keyBoardType: TextInputType.text,
              ),
              CommonTextField(
                hintText: 'Description',
                textEditingController: descriptionController,
                keyBoardType: TextInputType.text,
              ),
              CustomButton(
                onPressed: () {
                  if(namecontroller.text.isNotEmpty && descriptionController.text.isNotEmpty)
                  Provider.of<ItemAddNotifier>(context, listen: false)
                      .updateItem( Model(
                    name:namecontroller.text, id:id!, title: descriptionController.text,
                  ),position);
                  Navigator.pop(context);
                },
                child: CustomText(
                  alignment: MainAxisAlignment.center,
                  text: "Update Data",
                  size: 20,
                  textColor: Colors.white,
                ),
                margin: 20,
              )
            ],
          ),

        ));
  }


}

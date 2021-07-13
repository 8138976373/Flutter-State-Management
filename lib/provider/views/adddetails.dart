import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/model/datamodel.dart';
import 'package:flutter_state_management/provider/notifiers/itemaddnotifier.dart';
import 'package:flutter_state_management/provider/widget/customappbar.dart';
import 'package:flutter_state_management/provider/widget/custombutton.dart';
import 'package:flutter_state_management/provider/widget/customtext.dart';
import 'package:flutter_state_management/provider/widget/customtextfield.dart';
import 'package:provider/provider.dart';

class AddData extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index =  Provider.of<ItemAddNotifier>(context, listen: false).itemList.length;
    int id;
    if(index == 0){
      id  = 0;
    }else {
      id = Provider
          .of<ItemAddNotifier>(context, listen: false)
          .itemList[index].id;
    }
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
                        .addItem( Model(
                      name:namecontroller.text, id:id+1, title: descriptionController.text,
                    ),);
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    alignment: MainAxisAlignment.center,
                    text: "Add Data",
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

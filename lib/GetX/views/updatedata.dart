import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/GetX/controller/getxcontroller.dart';
import 'package:flutter_state_management/GetX/model/datamodel.dart';
import 'package:flutter_state_management/GetX/widget/customappbar.dart';
import 'package:flutter_state_management/GetX/widget/custombutton.dart';
import 'package:flutter_state_management/GetX/widget/customtext.dart';
import 'package:flutter_state_management/GetX/widget/customtextfield.dart';
import 'package:get/get.dart';

class UpdateData extends GetView<DataController> {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DataController _controller = Get.find<DataController>();
  int index = Get.find<DataController>().list.length;
  int id;

  UpdateData({required this.id});
  void setText() {
    namecontroller.text = _controller.list[id].name;
    descriptionController.text = _controller.list[id].title;
  }
  @override
  Widget build(BuildContext context) {
    setText();
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
                  _controller.updateData( Model(
                    name:namecontroller.text, id:_controller.list[id].id, title: descriptionController.text,
                  ),id);
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/Bloc/cubit/homecubit.dart';
import 'package:flutter_state_management/Bloc/model/datamodel.dart';
import 'package:flutter_state_management/Bloc/widget/customappbar.dart';
import 'package:flutter_state_management/Bloc/widget/custombutton.dart';
import 'package:flutter_state_management/Bloc/widget/customtext.dart';
import 'package:flutter_state_management/Bloc/widget/customtextfield.dart';

class UpdateDataPage extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int position;
  int? id;
  UpdateDataPage({required this.position});
  void setText(BuildContext context) {
    id =context.read<HomeCubit>().list[position].id;
    namecontroller.text = context.read<HomeCubit>().list[position].name;
    descriptionController.text = context.read<HomeCubit>().list[position].title;
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
                  context.read<HomeCubit>().updateData(  dataModel: Model(
                    name:namecontroller.text, id:id!, title: descriptionController.text,
                  ), position: position);
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

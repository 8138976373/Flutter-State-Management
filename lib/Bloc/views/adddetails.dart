import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/Bloc/cubit/homecubit.dart';
import 'package:flutter_state_management/Bloc/model/datamodel.dart';
import 'package:flutter_state_management/Bloc/widget/customappbar.dart';
import 'package:flutter_state_management/Bloc/widget/custombutton.dart';
import 'package:flutter_state_management/Bloc/widget/customtext.dart';
import 'package:flutter_state_management/Bloc/widget/customtextfield.dart';

class AddDataPage extends StatelessWidget {
  TextEditingController namecontroller = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    int index = context.read<HomeCubit>().list.length;
    int id;
    if(index == 0){
      id = 0;
    }else {
      id = context
          .read<HomeCubit>()
          .list[index - 1].id;
    }
    return Scaffold(
        appBar: CustomAppBar(
          title: 'GetX App',
        ),
        body: Container(
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
                  context.read<HomeCubit>().addData(
                        Model(
                          name: namecontroller.text,
                          id: id + 1,
                          title: descriptionController.text,
                        ),
                      );

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

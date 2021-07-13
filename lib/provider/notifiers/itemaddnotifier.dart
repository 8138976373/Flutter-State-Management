

import 'package:flutter/material.dart';
import 'package:flutter_state_management/provider/model/datamodel.dart';


class ItemAddNotifier extends ChangeNotifier {
  //
  List<Model> itemList = [];

  addItem(Model item) async {
    itemList.add(item);
    notifyListeners();
  }

  updateItem(Model item,int position) async {
    itemList[position] = item;
    notifyListeners();
  }

  deleteItem(int index) async {
    itemList.removeAt(index);
    notifyListeners();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/Bloc/cubit/homecubit.dart';
import 'package:flutter_state_management/Bloc/cubit/homestate.dart';
import 'package:flutter_state_management/Bloc/model/datamodel.dart';
import 'package:flutter_state_management/Bloc/widget/customappbar.dart';
import 'package:flutter_state_management/Bloc/widget/customflottingbutton.dart';
import 'package:flutter_state_management/Bloc/widget/customtext.dart';

import 'updatedetails.dart';

class HomePage extends StatelessWidget {
  final String title;
  final Axis scrollDirection;
  HomePage({Key? key, required this.title, required this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().fetchData();

    return Scaffold(
      appBar:  CustomAppBar(title: title),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is HomeLoaded) {
            List<Model>  list = state.list;
            if(scrollDirection == Axis.horizontal){
              return horizontalListView(context, list);
            }else{
            return verticalListView(list);
            }
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingButton(scrollDirection: scrollDirection, title: title,)
    );
  }

  ListView verticalListView(List<Model> list) {
    return ListView.separated(
      separatorBuilder: (context, position) => SizedBox(
        height: 5.0,
      ),
      itemCount: list.length,
      itemBuilder: (context, position) {
        return Card(
          child: ListTile(
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
                            context.read<HomeCubit>().deleteData(position);
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
                                builder: (context) => UpdateDataPage(position: position),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  });
            },
            leading: Text('${list[position].id}'),
            title: Text('${list[position].name}'),
            subtitle: Text('${list[position].title}'),
          ),
        );
      },
    );
  }

  Row horizontalListView(BuildContext context,List<Model> list) {
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
                                context.read<HomeCubit>().deleteData(position);
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
                                    builder: (context) => UpdateDataPage(position: position),
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_flavor/model/Items.dart';
import 'package:u_flavor/ui/screens/bloc/Bloc.dart';
import 'package:u_flavor/ui/screens/bloc/events/ClickEvents.dart';
import 'package:u_flavor/ui/screens/bloc/events/GetDataEvents.dart';
import 'package:u_flavor/ui/screens/bloc/states/ClickStates.dart';
import 'package:u_flavor/ui/screens/bloc/states/GetDataStates.dart';

class CategoriesMenuScreen extends StatelessWidget {
  TextEditingController _searchController = TextEditingController();
  String? _title;
  CategoriesMenuScreen(this._title);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
                  GetDataBloc(initializeGetDataState())),
          BlocProvider(
              create: (BuildContext context) =>
                  ClickBloc(initializeClickState()))
        ],
        child: SafeArea(
          child: SafeArea(
                  child: Scaffold(
                appBar: AppBar(
                  title: Center(child: Text(_title == null ? "Empty" : _title!)),
                ),
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/menu_bg.jpg'),
                    fit: BoxFit.cover,
                  )),
                  child: BlocBuilder<GetDataBloc,GetDataStates>(
                    builder: (BuildContext context,GetDataStates state){
                      GetDataBloc.get(context).add(GetCategoriesItemsEvent());
                      return Column(
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 10.0),
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TextField(
                                controller: _searchController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {},
                                    ),
                                    hintText: "Search",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24.0))),
                              ),
                            ),
                          ),
                          Expanded(
                            child: createListOfFood(GetDataBloc.items.where((i) => i.type.toLowerCase() == _title!.toLowerCase()).toList()),
                          )
                        ],
                      );
                    },

                  ),
                ),
              )),
        )
    );
  }

  createListOfFood(List<Item> foodItem) {
    return BlocBuilder<ClickBloc, ClickStates>(
      builder: (BuildContext context, ClickStates state) {
        return Container(
            child: ListView.builder(
                itemCount: foodItem.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Card(
                        shape: Border(
                            left: BorderSide(color: Colors.red, width: 7)),
                        borderOnForeground: true,
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width - 84),
                              padding: EdgeInsets.only(left: 15.0, top: 10.0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    foodItem[index].name,
                                    style: TextStyle(fontSize: 25.0),
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text(
                                    foodItem[index].counter.toString(),
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        ClickBloc.get(context)
                                            .add(SelectItemEvent(index));
                                      },
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 20.0,
                                        color: Colors.white,
                                      ),
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.amber),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                }));
      },
    );
  }
}

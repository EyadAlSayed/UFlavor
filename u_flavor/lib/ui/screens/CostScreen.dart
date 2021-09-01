import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:u_flavor/model/Items.dart';
import 'package:u_flavor/ui/screens/bloc/Bloc.dart';
import 'package:u_flavor/ui/screens/bloc/events/ClickEvents.dart';

import 'bloc/states/ClickStates.dart';
import 'bloc/states/GetDataStates.dart';

class CostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ClickBloc(initializeClickState()),
        child: SafeArea(
            child: Scaffold(
                body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/menu_bg.jpg'),
                            fit: BoxFit.cover)),
                    child: BlocConsumer<ClickBloc, ClickStates>(
                        listener: (BuildContext context, ClickStates state) {
                      print("get data ");
                    }, builder: (BuildContext context, ClickStates state) {
                      return Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Center(
                                child: Text(
                              getTotalCost(GetDataBloc.bills) + ' \$',
                              style: TextStyle(fontSize: 20.0),
                            )),
                          ),
                          Expanded(
                            child: createListOfCostItem(GetDataBloc.bills,context),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.amber),
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.08,
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: TextButton(
                              onPressed: () {
                                ClickBloc.get(context).add(MakeOrderEvent(GetDataBloc.bills));
                              },
                              child: Text(
                                "Make an Order",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              ),
                            ),
                          )
                        ],
                      );
                    })))));
  }

  createListOfCostItem(List<BillItem> billItems,BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: billItems.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Slidable(
                  secondaryActions: [
                    IconSlideAction(
                      icon: Icons.delete,
                      caption: 'delete',
                      color: Colors.red,
                      onTap: () {
                        ClickBloc.get(context).add(DeleteItemEvent(index));
                      },
                    )
                  ],
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.18,
                  child: Card(
                    elevation: 5,
                    shape:
                        Border(left: BorderSide(color: Colors.amber, width: 7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width / 2),
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              billItems[index].name,
                              style: TextStyle(fontSize: 20.0),
                            )),
                        Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              billItems[index].cost.toString() + ' \$',
                              style: TextStyle(fontSize: 18.0),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
  }
  getTotalCost(List<BillItem> billItems) {
    double res = 0;
    for (BillItem x in billItems) {
      res += x.cost!;
    }
    return res.toString();
  }
}

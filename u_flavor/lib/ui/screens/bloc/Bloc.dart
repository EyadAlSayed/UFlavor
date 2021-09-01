import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_flavor/RestAPI/RestAPI.dart';
import 'package:u_flavor/model/Items.dart';
import 'package:u_flavor/ui/screens/bloc/events/ClickEvents.dart';
import 'package:u_flavor/ui/screens/bloc/events/GetDataEvents.dart';
import 'package:u_flavor/ui/screens/bloc/events/NavigationEvents.dart';
import 'package:u_flavor/ui/screens/bloc/states/ClickStates.dart';
import 'package:u_flavor/ui/screens/bloc/states/GetDataStates.dart';
import 'package:u_flavor/ui/screens/bloc/states/NavigationStates.dart';

class ClickBloc extends Bloc<ClickEvents, ClickStates> {
  @override
  ClickStates get initialState => initializeClickState();

  ClickBloc(ClickStates initialState) : super(initialState);

  static ClickBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  Stream<ClickStates> mapEventToState(ClickEvents event) async* {
    if (event is SelectItemEvent) {
      yield* _change(event.idx, "select item");
    } else if (event is DeleteItemEvent) {
      yield* _change(event.idx, "delete item");
    } else if (event is MakeOrderEvent) {
      yield* _change(event.items, "make an order");
    }
  }

  Stream<ClickStates> _change(var data, String message) async* {
    if (message == "select item") {
      GetDataBloc.items[data].counter++;
      GetDataBloc.image[data].counter++;
      Item item = GetDataBloc.items[data];
      GetDataBloc.bills.add(BillItem(cost: 100, counter: item.counter, name: item.name));
    } else if (message == "delete item") {
      BillItem item = GetDataBloc.bills[data];
      GetDataBloc.items
          .firstWhere((element) => element.name == item.name)
          .counter--;
      GetDataBloc.image
          .firstWhere((element) => element.name == item.name)
          .counter--;
      GetDataBloc.bills.remove(item);
    }
    else if(message == "make an order"){
      List<BillItem> order = data as List<BillItem>;
      RestAPI.postOrder(order);
    }

    yield SuccessClickState();
  }
}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  int selectedIdx = 0;

  @override
  NavigationStates get initialState => initializeNavigationState();

  NavigationBloc(NavigationStates initialState) : super(initialState);

  static NavigationBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    if (event is BottomBarEvent) {
      yield* _change(event.idx);
    }
  }

  Stream<NavigationStates> _change(var flag) async* {
    if (flag is int) {
      selectedIdx = flag;
    }
    yield SuccessNavigationState();
  }
}

class GetDataBloc extends Bloc<GetDataEvents, GetDataStates> {
  static List<Item> items = [];
  static List<ImageItem> image = [];
  static List<BillItem> bills = [];

  GetDataBloc(GetDataStates initialState) : super(initialState);

  static GetDataBloc get(BuildContext context) => BlocProvider.of(context);

  @override
  GetDataStates get initialState => initializeGetDataState();

  @override
  Stream<GetDataStates> mapEventToState(GetDataEvents event) async* {
    if (event is GetCategoriesItemsEvent) {
      yield* _change("Get Categories");
    } else if (event is GetCategoriesImageEvent) {
      yield* _change("Get Categories Image");
    }
  }

  Stream<GetDataStates> _change(String s) async* {

    if (s == "Get Categories") {
      if (items.isEmpty) {
        items = RestAPI.getCategoriesItem();
      }
      if (image.isEmpty) {
        image = RestAPI.getCategoriesAsImage(items);
      }
    } else if (s == "Get Categories Image") {
      if (items.isEmpty) {
        items = RestAPI.getCategoriesItem();
      }
      if (image.isEmpty) {
        image = RestAPI.getCategoriesAsImage(items);
      }
    }
    yield SuccessGetDatakState();
  }
}

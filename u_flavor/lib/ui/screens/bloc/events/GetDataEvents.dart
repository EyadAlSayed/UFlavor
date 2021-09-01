import 'package:flutter/cupertino.dart';

@immutable
abstract class GetDataEvents{
const GetDataEvents();
}

class GetCategoriesItemsEvent extends GetDataEvents {

}

class GetCategoriesImageEvent extends GetDataEvents { }

class GetBillItemsEvent extends GetDataEvents{ }
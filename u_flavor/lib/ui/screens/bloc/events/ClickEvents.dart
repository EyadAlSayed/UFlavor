import 'package:flutter/cupertino.dart';
import 'package:u_flavor/model/Items.dart';

@immutable
abstract class ClickEvents {
  const ClickEvents();
}


class SelectItemEvent extends ClickEvents{
int idx;
SelectItemEvent(this.idx);
}

class DeleteItemEvent extends ClickEvents{
  int idx;
  DeleteItemEvent(this.idx);
}

class MakeOrderEvent extends ClickEvents{
  List<BillItem> items;
  MakeOrderEvent(this.items);
}

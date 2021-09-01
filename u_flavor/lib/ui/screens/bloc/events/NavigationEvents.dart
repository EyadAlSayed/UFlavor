
import 'package:flutter/cupertino.dart';

@immutable
abstract class NavigationEvents{
  const NavigationEvents();
}

class BottomBarEvent extends NavigationEvents{
  int idx = -1;
  BottomBarEvent(this.idx);
}

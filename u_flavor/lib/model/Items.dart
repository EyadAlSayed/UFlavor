class Item{
  int counter;
  String name;
  String type;
  Item({this.counter = 0, this.name = "",this.type=""});
}

class ImageItem extends Item{
  String imagePath;
  ImageItem({this.imagePath="",int counter = 0,String name="",String type=""}) : super(counter:counter,name:name,type: type);
}

class BillItem extends Item{
  int? cost;
  BillItem({this.cost = 0,int counter = 0,String name = "",String type=""}):super(counter: counter,name: name,type: type);
}
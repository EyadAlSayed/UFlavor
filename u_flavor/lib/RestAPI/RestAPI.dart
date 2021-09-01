import 'package:u_flavor/model/Items.dart';
import 'package:http/http.dart' as http;

class RestAPI{

    static const String _BASE_URL ="";

    static List<Item> getCategoriesItem(){
      return [
        Item(counter: 0, name: "Fajita in a bowl",type: "meats"),
        Item(counter: 0, name: "Papa burger",type: "meats"),
        Item(counter: 0, name: "Caesar salad",type: "vegetables"),
        Item(counter: 0, name: "Grilled vegetables",type: "vegetables"),
        Item(counter: 0, name: "Tiramisu",type: "desserts"),
        Item(counter: 0, name: "Mangomisu",type: "desserts"),
        Item(counter: 0, name: "Apple martin",type: "drinks"),
        Item(counter: 0, name: "Margarita",type: "drinks")
      ];
    }
    static List<ImageItem> getCategoriesAsImage(List<Item> items){
      return [
        ImageItem(
            imagePath: "assets/chicken_fajita_bowl.jpg",
            counter: items[0].counter,
            name: items[0].name),
        ImageItem(
            imagePath: "assets/papa_burger.jpg",
            counter: items[1].counter,
            name: items[1].name),
        ImageItem(
            imagePath: "assets/caesar_salad.jpg",
            counter: items[2].counter,
            name: items[2].name),
        ImageItem(
            imagePath: "assets/grilled_vegetables.jpg",
            counter: items[3].counter,
            name: items[3].name),
        ImageItem(
            imagePath: "assets/tiramisu.jpg",
            counter: items[4].counter,
            name: items[4].name),
        ImageItem(
            imagePath: "assets/mangomisu.jpg",
            counter: items[5].counter,
            name: items[5].name),
        ImageItem(
            imagePath: "assets/apple_martin.jpg",
            counter: items[6].counter,
            name: items[6].name),
        ImageItem(
            imagePath: "assets/margarita.jpg",
            counter: items[7].counter,
            name: items[7].name)
      ];
    }

  static void postOrder(List<Item> items) {
      print('Submit the order ..');
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_flavor/ui/screens/CategoriesMenuScreen.dart';
import 'package:u_flavor/ui/screens/bloc/Bloc.dart';
import 'package:u_flavor/ui/screens/bloc/states/NavigationStates.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            NavigationBloc(initializeNavigationState()),
        child: SafeArea(
          child: Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/menu_bg.jpg'),
                fit: BoxFit.cover,
              )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  child: BlocConsumer<NavigationBloc, NavigationStates>(
                    listener: (BuildContext context, NavigationStates state) {
                      if (state is NavigationStates) {
                        print('success navigation state');
                      }
                    },
                    builder: (BuildContext context, NavigationStates state) {
                      return GridView.count(
                        crossAxisCount: 1,
                        padding: EdgeInsets.all(0.2),
                        childAspectRatio: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        children: [
                          createButtonImageWithOpacity(
                              "Vegetables",
                              [Colors.green, Colors.lightGreen, Colors.white],
                              'assets/vegetables.jpg',
                              context),
                          createButtonImageWithOpacity(
                              "Meats",
                              [Colors.red, Colors.redAccent, Colors.white],
                              'assets/meat.jpg',
                              context),
                          createButtonImageWithOpacity(
                              "Desserts",
                              [Colors.pink, Colors.pinkAccent, Colors.white],
                              'assets/dessert.jpg',
                              context),
                          createButtonImageWithOpacity(
                              "Drinks",
                              [
                                Colors.deepOrangeAccent,
                                Colors.orangeAccent,
                                Colors.white
                              ],
                              'assets/drinks.jpg',
                              context),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  createButtonImageWithOpacity(
      String text, List<Color> colors, String imagePath, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: LinearGradient(
            colors: [
              colors[0],
              colors[1],
              colors[2],
            ],
            begin: Alignment.centerRight,
            end: Alignment.center,
          ),
        ),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.48,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
                child: Text(
              text,
              style: TextStyle(fontSize: 40.0, color: Colors.white),
            )),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoriesMenuScreen(text)));
                  },
                  child: Text(""),
                ),
              ),
            )
          ],
        ));
  }
}

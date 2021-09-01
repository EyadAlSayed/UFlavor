import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_flavor/ui/screens/CategoriesScreen.dart';
import 'package:u_flavor/ui/screens/CostScreen.dart';
import 'package:u_flavor/ui/screens/ImagesScreen.dart';
import 'package:u_flavor/ui/screens/bloc/Bloc.dart';
import 'package:u_flavor/ui/screens/bloc/events/NavigationEvents.dart';
import 'package:u_flavor/ui/screens/bloc/states/NavigationStates.dart';

class MenuScreen extends StatelessWidget {
  late int _selectedIndex;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
        create: (BuildContext context) =>
            NavigationBloc(initializeNavigationState()),
        child: BlocConsumer<NavigationBloc, NavigationStates>(
          listener: (BuildContext context, NavigationStates state) {
            if (state is SuccessNavigationState) {
            }
          },
          builder: (BuildContext context, NavigationStates state) {
            _selectedIndex = NavigationBloc.get(context).selectedIdx;
            return SafeArea(
              child: Scaffold(
                body: PageView(
                  controller: _pageController,
                  children: [buildPage()],
                ),
                bottomNavigationBar: createBottomNavyBar(context),
              ),
            );
          },
        ));
  }

  buildPage() {
    switch (_selectedIndex) {
      case 0:
        return CategoriesScreen();
      case 1:
        return ImagesScreen();
      case 2:
        return CostScreen();
    }
  }

  createBottomNavyBar(BuildContext context) {
    final inActiveColor = Colors.white;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
            color: Colors.red, width: MediaQuery.of(context).size.width * 0.01),
      ),
      child: BottomNavyBar(
        backgroundColor: Colors.red,
        containerHeight: MediaQuery.of(context).size.height * 0.09,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) {
          NavigationBloc.get(context).add(BottomBarEvent(index));
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text("Categories"),
            activeColor: inActiveColor,
            textAlign: TextAlign.center,
            inactiveColor: inActiveColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.image_sharp),
            title: Text('Images'),
            activeColor: inActiveColor,
            textAlign: TextAlign.center,
            inactiveColor: inActiveColor,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Cost'),
            activeColor: inActiveColor,
            textAlign: TextAlign.center,
            inactiveColor: inActiveColor,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_flavor/model/Items.dart';
import 'package:u_flavor/ui/screens/bloc/Bloc.dart';
import 'package:u_flavor/ui/screens/bloc/events/GetDataEvents.dart';
import 'package:u_flavor/ui/screens/bloc/states/GetDataStates.dart';
import 'bloc/events/ClickEvents.dart';
import 'bloc/states/ClickStates.dart';

class ImagesScreen extends StatelessWidget {
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
          child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/menu_bg.jpg"),
                        fit: BoxFit.cover)),
                child: createListOfButtonImage(context, GetDataBloc.image)),
          ),
        )
    );
  }

  createListOfButtonImage(BuildContext context, List<ImageItem> images) {
    return BlocBuilder<GetDataBloc, GetDataStates>(
        builder: (BuildContext context, GetDataStates state) {
          GetDataBloc.get(context).add(GetCategoriesImageEvent());

          return Container(
            child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return createButtonImage(images[index], index);
                }),
          );
        }
    );
  }

  createButtonImage(ImageItem image, int index) {
    return BlocBuilder<ClickBloc, ClickStates>(
        builder: (BuildContext context, ClickStates state) {
          return Container(
            width: double.infinity,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.4,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ]),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image.imagePath),
                          fit: BoxFit.cover)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20.0, right: 40.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          image.counter.toString(),
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            ClickBloc.get(context).add(SelectItemEvent(index));
                          },
                          child: Icon(
                            Icons.add_circle_outline,
                            size: 30.0,
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
          );
        }
    );
  }
}



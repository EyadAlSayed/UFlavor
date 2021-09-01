import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:u_flavor/ui/screens/MenuScreen.dart';

class TableScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            colors: [Colors.red, Colors.redAccent],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 36.0, horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Make a new Order ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 46.0,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "To server an new client ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Color(0xFFe7edeb),
                                hintText: "Employee name ",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey[600],
                                )),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Color(0xFFe7edeb),
                                hintText: "Table number",
                                prefixIcon: Icon(
                                  Icons.add_business,
                                  color: Colors.grey[600],
                                )
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.1,
                            child: TextButton(
                                child: Text("Submit",
                                style: TextStyle(
                                  fontSize: 22,
                                ),),
                                onPressed: () {
                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.rightToLeft,
                                        child: MenuScreen()
                                  ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(

                                        color: Colors.redAccent,
                                        width: 5,
                                      ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))
                                    ),
                                    backgroundColor: Colors.white30)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

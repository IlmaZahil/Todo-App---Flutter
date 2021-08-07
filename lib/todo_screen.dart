import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isProfileScreen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Scaffold(
        appBar: AppBar(
          leading: isProfileScreen
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isProfileScreen = false;
                    });
                  },
                  icon: Icon(Icons.clear_outlined),
                  iconSize: 40,
                  color: Colors.indigo[700],
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      xOffset = 300;
                      yOffset = 150;
                      scaleFactor = 0.6;
                      isProfileScreen = true;
                    });
                  },
                  icon: Icon(Icons.clear_all_outlined),
                  iconSize: 40,
                  color: Colors.indigo[700],
                ),
          title: Text(
            "Todos",
            style: TextStyle(
                color: Colors.indigo[700],
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 25, 178, 238),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 25, 178, 238),
                Color.fromARGB(255, 21, 236, 229)
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Image.asset(
                    'images/todo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              DraggableScrollableSheet(
                  maxChildSize: 0.85,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Stack(overflow: Overflow.visible, children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "Task No $index",
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "This is the detail of the task $index",
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(
                                Icons.check_circle,
                                color: Colors.greenAccent,
                              ),
                              isThreeLine: true,
                            );
                          },
                          controller: scrollController,
                          itemCount: 20,
                        ),
                      ),
                      Positioned(
                        top: -30,
                        right: 30,
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.indigo[700],
                          onPressed: () {},
                        ),
                      ),
                    ]);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

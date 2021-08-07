import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Stack(
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
          Positioned(
            child: Text(
              "Todos",
              style: TextStyle(
                  color: Colors.indigo[600],
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 70,
            left: 20,
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.85,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                      backgroundColor: Colors.deepOrange[200],
                      onPressed: () {},
                    ),
                  ),
                ]);
              }),
        ],
      ),
    );
  }
}

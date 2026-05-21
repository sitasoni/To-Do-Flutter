import 'package:flutter/material.dart';

import 'CustomWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void onChange(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }

  List todo = [
    ["Wake up", false],
    ["Office Hour", false],
    ["Rest time", false],
    ["Math", false],
    ["Reasoning", false],
    ["English", false],
    ["Gk/GS", false],
  ];

  void addTodoDialog(){

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text("Plan your day!"))),
        body: Container(
          // width: double.infinity,
          // height: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      title: todo[index][0],
                      isTrue: todo[index][1],
                      onChange: (po) {
                        onChange(index);
                      },
                    );
                  },
                ),
              ),
              // Spacer(),
              Align(
                // mainAxisAlignment: MainAxisAlignment.end,
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

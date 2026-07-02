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

  TextEditingController titleController = TextEditingController();

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

  void addTodoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 200,
            padding: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Item!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: "Todo's Title",
                    // hintText: "Enter title",
                    // border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          todo.add([titleController.text.toString(), false]);
                          Navigator.pop(context);
                          titleController.clear();
                        });
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: GestureDetector(onTap : (){Navigator.pop(context);},child: Icon(Icons.arrow_back)),
                title: Text("To Do Master", textAlign: TextAlign.center),
                subtitle: Text(
                  "Plan your day!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Divider(height: 1),
              ListTile(leading: Icon(Icons.home), title: Text("Home")),
              ListTile(leading: Icon(Icons.info), title: Text("Info")),
              ListTile(leading: Icon(Icons.info), title: Text("About Us")),
              Spacer(),
              Divider(height: 1),
              ListTile(title: Text("Version", textAlign: TextAlign.center)),
            ],
          ),
        ),
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
                  onPressed: () {
                    addTodoDialog();
                  },
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

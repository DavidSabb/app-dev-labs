import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatelessWidget {
  TodoHome({super.key});

  final CollectionReference tasks =
  FirebaseFirestore.instance.collection('tasks');

  void addTask(BuildContext context) {
    String newTask = "";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Task", style: TextStyle(fontSize: 22)),
            TextField(
              autofocus: true,
              onChanged: (value) => newTask = value,
              decoration: InputDecoration(hintText: "Enter task"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (newTask.trim().isNotEmpty) {
                  tasks.add({
                    "title": newTask.trim(),
                    "isDone": false,
                  });
                }
                Navigator.pop(ctx);
              },
              child: Text("Add"),
            )
          ],
        ),
      ),
    );
  }

  void toggleDone(String id, bool current) {
    tasks.doc(id).update({"isDone": !current});
  }

  void deleteTask(String id) {
    tasks.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTask(context),
        backgroundColor: Colors.black87,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Todoey",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            // Task Count
            StreamBuilder(
              stream: tasks.snapshots(),
              builder: (context, snapshot) {
                int count = snapshot.hasData ? snapshot.data!.docs.length : 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "$count Tasks",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                );
              },
            ),

            SizedBox(height: 20),

            // White task container
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                // Realtime Task List
                child: StreamBuilder(
                  stream: tasks.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final docs = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        var task = docs[index];
                        String id = task.id;
                        String title = task["title"];
                        bool isDone = task["isDone"];

                        return Dismissible(
                          key: Key(id),
                          background: Container(
                            color: Colors.red,
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (_) => deleteTask(id),
                          child: ListTile(
                            title: Text(
                              title,
                              style: TextStyle(
                                decoration: isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: Checkbox(
                              value: isDone,
                              onChanged: (_) => toggleDone(id, isDone),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

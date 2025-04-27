import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List tasks = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      final response = await http.get(Uri.parse('https://amock.io/api/researchUTH/tasks'));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        setState(() {
          if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
            tasks = responseData['data'] ?? [];
          } else if (responseData is List) {
            tasks = responseData;
          }
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load tasks. Status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching tasks: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : tasks.isEmpty
                  ? Center(child: Text('No Tasks Yet! Stay productive—add something to do'))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(tasks[index]['title'] ?? 'No Title'),
                          subtitle: Text(tasks[index]['description'] ?? 'No Description'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskDetailScreen(taskId: tasks[index]['id']),
                              ),
                            );
                          },
                        );
                      },
                    ),
    );
  }
}

class TaskDetailScreen extends StatefulWidget {
  final int taskId;
  TaskDetailScreen({required this.taskId});

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  Map task = {};
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTaskDetail();
  }

  Future<void> fetchTaskDetail() async {
    try {
      final response = await http.get(Uri.parse('https://amock.io/api/researchUTH/task/${widget.taskId}'));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        setState(() {
          if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
            task = responseData['data'] ?? {};
          }
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load task details. Status code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching task details: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : task.isEmpty
                  ? Center(child: Text('No Details Available'))
                  : Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(task['title'] ?? 'No Title',
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(task['description'] ?? 'No Description'),
                          SizedBox(height: 20),
                          Text('Subtasks', style: TextStyle(fontWeight: FontWeight.bold)),
                          ...?task['subtasks']?.map<Widget>((subtask) => Text('- ${subtask['title']}')).toList(),
                          SizedBox(height: 20),
                          Text('Attachments', style: TextStyle(fontWeight: FontWeight.bold)),
                          ...?task['attachments']?.map<Widget>((file) => Text(file['fileName'])).toList(),
                        ],
                      ),
                    ),
    );
  }
}

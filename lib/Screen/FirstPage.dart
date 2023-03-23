import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxfetchapi1/controller/Controller.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Obx(() {
        if (todoController.todoList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: todoController.todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoController.todoList[index]['title']),
                subtitle: Text(todoController.todoList[index]['completed']
                    ? 'Completed'
                    : 'Not Completed'),
              );
            },
          );
        }
      }),
    );
  }
}

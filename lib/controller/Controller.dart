import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  var todoList = [].obs;

  @override
  void onInit() {
    fetchTodoList();
    super.onInit();
  }

  void fetchTodoList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      todoList.value = jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
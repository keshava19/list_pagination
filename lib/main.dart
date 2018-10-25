import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_pagination/models/employee.dart';
import 'package:list_pagination/models/pagination.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'List Pagination',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'List Pagination'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cacheData = Map<int, Employee>();
  var pageLoaded = Map<int, bool>();

  int _total = 0;

  @override
  void initState() {
    setState(() {
      //Total number of objects expected form the list.
      _total = 300;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listView = ListView.builder(
      itemCount: _total,
      itemBuilder: (BuildContext context, int index) {
        Employee employee = _getEmployee(index);
        return ListTile(
          leading: CircleAvatar(
            child: Text(index.toString()),
            radius: 20.0,
            backgroundColor: randomColor,
          ),
          title: Text(employee.displayName),
          subtitle: Text(employee.jobtitle),
        );
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Scrollbar(child: listView)
    );
  }

  Future<List<Employee>> _getEmployees(int page, int size) async {
    String jsonString = await _getJson(page, size);

    List list = json.decode(jsonString);

    var employees = List<Employee>();
    list.forEach((employee) {
      Map map = employee as Map;
      employees.add(Employee.fromJson(map));
    });

    return employees;
  }

  Future<String> _getJson(int page, int size) async {

    Pagination pagination = Pagination(page, size);
    Map<String, dynamic> data = pagination.toJson();
    String params = json.encode(data);
    String url = 'http://10.0.3.147:8888/employees/$params';

    final response = await http.get(url);

    return response.body;
  }

  Employee _getEmployee(int index) {
    Employee employee = cacheData[index];
    if(employee == null) {
      int page = index ~/ 20;
      if(!pageLoaded.containsKey(page)) {
        pageLoaded.putIfAbsent(page, () => true);
        _getEmployees(page, 20)
            .then((List<Employee> employees) => _updateEmployees(page, employees));
      }
      //print(cacheData);
      employee = Employee.loading();
    }
    return employee;
  }

  _updateEmployees(int page, List<Employee> employees) {
    setState(() {
      for(int i = 0; i < employees.length; i++){
        cacheData.putIfAbsent(page*employees.length + i, () => employees.elementAt(i));
      }
    });
  }

}

/// The list of colors for the random colors.
List<Color> get colors => [
      Colors.blue[400],
      Colors.pink[400],
      Colors.red[400],
      Colors.lime[400],
      Colors.teal[400],
      Colors.green[400],
      Colors.cyan[400],
      Colors.indigo[400],
      Colors.purple[400],
      Colors.orange[400]
    ];

/// Method to get the random color from the list of colors.
Color get randomColor => colors[Random().nextInt(10)];

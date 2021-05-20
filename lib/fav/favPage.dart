import 'package:flutter/material.dart';
import 'dart:async';
import 'dbhelper.dart';
import 'favModel.dart';

class DBTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DBTestPageState();
  }
}

class _DBTestPageState extends State<DBTestPage> {
  //
  Future<List<FavRecipies>> employees;
  TextEditingController controller = TextEditingController();
  String name;
  int curUserId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      employees = dbHelper.getEmployees();
    });
  }

  SingleChildScrollView dataTable(List<FavRecipies> favRecipies) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NAME'),
          ),
          DataColumn(
            label: Text('DELETE'),
          )
        ],
        rows: favRecipies
            .map(
              (employee) => DataRow(cells: [
                DataCell(
                  Column(
                    children: [
                      Text(employee.title),
                      Text(employee.dec),
                       Text(employee.carb),
                        Text(employee.protein),
                         Text(employee.kcal),
                          Text(employee.imgUrl),
                           Text(employee.method),
                            Text(employee.ingr),
                           
                     
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      curUserId = employee.id;
                    });
                    controller.text = employee.title;
                  },
                ),
                DataCell(IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    dbHelper.delete(employee.id);
                    refreshList();
                  },
                )),
              ]),
            )
            .toList(),
      ),
    );
  }

  list() {
    return Expanded(
      child: FutureBuilder(
        future:employees,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return dataTable(snapshot.data);
          }

          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("No Data Found");
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter SQLITE CRUD DEMO'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            list(),
          ],
        ),
      ),
    );
  }
}

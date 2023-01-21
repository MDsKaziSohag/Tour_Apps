import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_application/Constines/Colors.dart';

class NavFavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(34, 0, 0, 0),
      body: ListView.builder(
        itemCount: 17,
        itemBuilder: (_, index) {
          return Card(
            color:  Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
               
                leading: Container(
                    width: 120.w,
                    child: Image.asset(
                      'images/codbari.jpg',
                      fit: BoxFit.cover,
                    ),
                    color: Color.fromARGB(73, 235, 235, 235)),
                title: Text('Comilla, Kutbari'),
                subtitle: Text('2500/-'),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever_outlined)),
              ),
            ),
          );
        },
      ),
    );
  }
}

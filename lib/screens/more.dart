import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child:const Text(
        "More Page",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}

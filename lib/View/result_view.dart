import 'package:flutter/material.dart';
import 'package:mvcapp/Controller/main_controller.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final Controller con = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("โปรแกรมคํานวณภาษีบุคคลธรรมดา"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("รายได้สุทธิ = " + con.income.toString()),
            SizedBox(
              height: 15,
            ),
            Text("ภาษีที่ต้องจ่าย = " + con.tax.toString()),
          ],
        ),
      ),
    );
  }
}

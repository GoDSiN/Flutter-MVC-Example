import 'package:flutter/material.dart';
import 'package:mvcapp/Controller/main_controller.dart';
import 'package:mvcapp/View/result_view.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  State<InsurancePage> createState() => _InsurancePageState();
}

class _InsurancePageState extends State<InsurancePage> {
  final Controller con = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("โปรแกรมคํานวณภาษีบุคคลธรรมดา"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("ประกันสังคม"),
              Checkbox(
                  checkColor: Colors.white,
                  value: con.social,
                  onChanged: (bool? value) {
                    setState(() {
                      con.CheckSocial(value);
                    });
                  }),
              Text("ประกันสุขภาพ"),
              Checkbox(
                  checkColor: Colors.white,
                  value: con.health,
                  onChanged: (bool? value) {
                    setState(() {
                      con.CheckHealth(value);
                    });
                  }),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    con.CalculateRealIncome(con.social, con.health);
                    con.CalculateTax(con.income);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage()));
                },
                child: Text("แสดงรายได้สุทธิ"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

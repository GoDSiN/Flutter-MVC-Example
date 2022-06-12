import 'package:flutter/material.dart';
import 'package:mvcapp/Controller/main_controller.dart';
import 'package:mvcapp/View/insurance_view.dart';

class Viewpage extends StatefulWidget {
  const Viewpage({Key? key}) : super(key: key);

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  final Controller con = Controller();
  final _formKey = GlobalKey<FormState>();

  var realSalary;
  var realMonth;
  var realCryptoProfit;
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
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "เงินเดือน",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "คุณลืมกรอกเงินเดือน";
                        }
                        realSalary = double.parse(value);
                        if (realSalary <= 0) {
                          return "กรุณากรอกเงินเดือนที่ไม่ใช่ 0";
                        }
                        return null;
                      },
                    ),
                    Text(
                      "จำนวนเดือนที่ได้รับเงินเดือน",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "คุณลืมกรอกจำนวนเดือน";
                        }
                        realMonth = int.parse(value);
                        if (realMonth < 1 || realMonth > 12) {
                          return "กรุณากรอกจำนวนเดือนเป็นจำนวนเต็มระหว่าง 1 - 12";
                        }
                        return null;
                      },
                    ),
                    Text(
                      "กำไรจากการเทรดคริปโตเคอเรนซี",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "คุณลืมกรอกจำนวนเดือน";
                        }
                        realCryptoProfit = int.parse(value);
                        if (realCryptoProfit <= 0) {
                          return "กรุณากรอกจำนวนกำไรที่มากกว่า 0";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            //เช็คvalidatorที่ตั้งไว้
                            bool pass = _formKey.currentState!.validate();
                            if (pass) {
                              //บันทึกข้อมูลตามที่กรอก
                              setState(() {
                                con.setSalary(realSalary);
                                con.setMonth(realMonth);
                                con.setCryptoProfit(realCryptoProfit);
                                con.CalculateIncome(
                                    realSalary, realMonth, realCryptoProfit);
                              });
                              //ไปยังหน้าเลือกประกัน
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InsurancePage()));
                            }
                          },
                          child: Text("บันทึกข้อมูลและไปยังหน้าเลือกประกัน"),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

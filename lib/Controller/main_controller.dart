import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvcapp/Models/insurance_model.dart';
import 'package:mvcapp/Models/revenue_model.dart';

class Controller extends ControllerMVC {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }

  static Controller _this = Controller._();

  Controller._();
  //ดึงข้อมูลจาก RevenueModel
  double get salary => RevenueModel.salary;
  int get month => RevenueModel.month;
  int get cryptoProfit => RevenueModel.cryptoprofit;
  double get income => RevenueModel.income;
  double get tax => RevenueModel.tax;

  void setSalary(inputSalary) {
    RevenueModel.setSalary(inputSalary);
  }

  void setMonth(inputMonth) {
    RevenueModel.setMonth(inputMonth);
  }

  void setCryptoProfit(inputCryptoProfit) {
    RevenueModel.setCryptoProfit(inputCryptoProfit);
  }

  void CalculateIncome(inputSalary, inputMonth, inputCryptoProfit) {
    RevenueModel.CalculateIncome(inputSalary, inputMonth, inputCryptoProfit);
  }

  //ดึงข้อมูลจาก InsuranceModel
  double get personalCost => InsuranceModel.personalCost;
  int get personalDiscount => InsuranceModel.personalDiscount;

  bool get social => InsuranceModel.social;
  bool get health => InsuranceModel.health;

  void CheckSocial(checkSocial) {
    InsuranceModel.checkSocial(checkSocial);
  }

  void CheckHealth(checkHealth) {
    InsuranceModel.checkhealth(checkHealth);
  }

  void CalculateRealIncome(checkSocial, checkHealth) {
    RevenueModel.CalculateRealIncome(social, health);
  }

  void CalculateTax(income) {
    RevenueModel.CalculateTax(income);
  }
}

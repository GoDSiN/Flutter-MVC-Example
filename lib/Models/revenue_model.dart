import 'dart:ffi';

class RevenueModel {
  //getter
  static double _salary = 0;
  static double get salary => _salary;

  static int _month = 0;
  static int get month => _month;

  static int _cryptoprofit = 0;
  static int get cryptoprofit => _cryptoprofit;

  static double _income = 0;
  static double get income => _income;

  static double _tax = 0;
  static double get tax => _tax;

  //setter
  static void setSalary(double inputSalary) => _salary = inputSalary;
  static void setMonth(int inputMonth) => _month = inputMonth;
  static void setCryptoProfit(int inputCryptoProfit) =>
      _cryptoprofit = inputCryptoProfit;
  static void CalculateIncome(double salary, int month, int cryptoprofit) {
    _income = (_salary * _month) + cryptoprofit;
  }

  //คำนวนรายได้สุทธิ หลังหักค่าใช้จ่ายและค่าลดหย่อน
  static double CalculateRealIncome(bool social, bool health) {
    //กรณี50%ของรายได้ ไม่เกิน100k
    if (_income / 2 < 100000) {
      _income = _income - (_income / 2);
      if (social && health) {
        _income = (_income - 5100) - 25000;
      } else if (social && !health) {
        _income = _income - 5100;
      } else if (!social || health) {
        _income = _income - 25000;
      } else {
        _income = _income;
      }
    } //กรณีครึ่งหนึ่งของรายได้ เกิน100k
    else {
      _income = _income - 100000;
      if (social && health) {
        _income = (_income - 5100) - 25000;
      } else if (social && !health) {
        _income = _income - 5100;
      } else if (!social || health) {
        _income = _income - 25000;
      } else {
        _income = _income;
      }
    }
    return _income;
  }

  static double CalculateTax(double income) {
    if (income >= 0 && income < 150000) {
      _tax = 0;
    } else if (income <= 300000) {
      _tax = (_income - 150000) * (5 / 100);
    } else if (income <= 500000) {
      _tax = ((_income - 300000) * (10 / 100)) + 7500;
    } else if (income <= 750000) {
      _tax = ((_income - 500000) * (15 / 100)) + 27500;
    } else if (income <= 1000000) {
      _tax = ((_income - 750000) * (20 / 100)) + 65000;
    } else if (income <= 2000000) {
      _tax = ((_income - 1000000) * (25 / 100)) + 115000;
    } else if (income <= 5000000) {
      _tax = ((_income - 2000000) * (30 / 100)) + 365000;
    } else if (income > 5000000) {
      _tax = ((_income - 5000000) * (35 / 100)) + 1265000;
    }

    return _tax;
  }
}

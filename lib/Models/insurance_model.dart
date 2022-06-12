class InsuranceModel {
  //ค่าใช้จ่ายส่วนบุคคลและค่าลดหย่อนส่วนตัว
  static double _personalCost = 0;
  static double get personalCost => _personalCost;
  static int _personalDiscount = 60000;
  static int get personalDiscount => _personalDiscount;

  //ประกันต่างๆ
  static bool _social = false;
  static bool get social => _social;

  static bool _health = false;
  static bool get health => _health;

  static void checkSocial(bool checkSocial) {
    _social = checkSocial;
  }

  static void checkhealth(bool checkHealth) {
    _health = checkHealth;
  }

}

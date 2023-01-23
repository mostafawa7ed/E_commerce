class Hints {
  static String product_name_hint = "product_name";
  static String image_url_hint = "image_url";
  static String description_hint = "description";
  static String department_hint = "department";
  static String adminoruser_hint = "adminoruser";
  static String adventage_hint = "adventage";
  static String disadventage_hint = "disadventage";
  static String notes1_hint = "notes1";
  static String notes2_hint = "notes2";
  static String rating_hint = "rating";
  static String brand_hint = "brand";
  static String model_number_hint = "model_number";
  static String color_hint = "color";
  static String item_weight_hint = "item_weight";
  static String numberitem_hint = "Quntity";
}

class Product {
  //   Map<String,dynamic> myproduct = {
  //   "product_name":,
  //   "image_url":,
  //   "description":,
  //   "department":,
  //   "adminoruser":,
  //   "adventage":,
  //   "disadventage":,
  //   "notes1":,
  //   "notes2":,
  //   "rating":,
  //   "brand":,
  //   "model_number":,
  //   "color":,
  //   "item_weight":,
  // };
  String? product_name;
  String? image_url;
  String? description;
  String? department;
  String? adminoruser;
  String? adventage;
  String? disadventage;
  String? notes1;
  String? notes2;
  String? rating;
  String? brand;
  String? model_number;
  String? color;
  String? item_weight;
  Product(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) {
    product_name = p1;
    image_url = p2;
    description = p3;
    department = p4;
    adminoruser = p5;
    adventage = p6;
    disadventage = p7;
    notes1 = p8;
    notes2 = p9;
    rating = p10;
    brand = p11;
    model_number = p12;
    color = p13;
    item_weight = p14;
  }
  String? get getproductname => product_name;

  void set setproductname(String name) {
    product_name = name;
  }
}

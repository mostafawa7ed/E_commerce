// ignore_for_file: non_constant_identifier_names

abstract class Person {
  final String name;
  final String number;
  final String idAuth;
  Person({required this.name, required this.number, required this.idAuth});
  add_product() {
    print(name);
  }

  remove_product(String id, String idAuth);

  edit_product(String id, String idAuth);

  update_product(String id, String idAuth);
}

class Admin extends Person {
  Admin({required super.name, required super.number, required super.idAuth});

  //Admin(name, number, idAuth) : super(name:name,number: number,idAuth: idAuth);
  @override
  edit_product(String id, String idAuth) {}

  @override
  remove_product(String id, String idAuth) {}

  @override
  update_product(String id, String idAuth) {}
}

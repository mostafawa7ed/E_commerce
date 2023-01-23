import 'package:app/core/constant/Colors.dart';
import 'package:app/core/constant/apiurl.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../core/class/person.dart';
import '../../../core/function/mediaqueryfun.dart';
import '../../../core/services/Apiconnection.dart';
import '../../../data/datasource/static/product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController product_name_controller = TextEditingController();
  TextEditingController image_url_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  TextEditingController department_controller = TextEditingController();
  TextEditingController adminoruser_controller = TextEditingController();
  TextEditingController adventage_controller = TextEditingController();
  TextEditingController disadventage_controller = TextEditingController();
  TextEditingController notes1_controller = TextEditingController();
  TextEditingController notes2_controller = TextEditingController();
  TextEditingController rating_controller = TextEditingController();
  TextEditingController brand_controller = TextEditingController();
  TextEditingController model_number_controller = TextEditingController();
  TextEditingController color_controller = TextEditingController();
  TextEditingController item_weight_controller = TextEditingController();
  TextEditingController numberitem_controller = TextEditingController();
  Crud _crud = Crud();
  @override
  Widget build(BuildContext context) {
    Admin admin = new Admin(
        idAuth: "sjdfnafb7kjasn238i8", name: "mostafa", number: "84962374");
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Add product"),
          centerTitle: true,
        ),
        backgroundColor: AppColor.blueAccent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: product_name_controller,
                  product_name_hint: Hints.product_name_hint),
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: image_url_controller,
                  product_name_hint: Hints.image_url_hint),
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: description_controller,
                  product_name_hint: Hints.description_hint),
              Row(
                children: [
                  CutomTextFaildNeeded(
                      precentage: 50,
                      type: 1,
                      size: size,
                      product: department_controller,
                      product_name_hint: Hints.department_hint),
                  CutomTextFaildNeeded(
                      precentage: 50,
                      type: 0,
                      size: size,
                      product: adminoruser_controller,
                      product_name_hint: Hints.adminoruser_hint),
                ],
              ),
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: adventage_controller,
                  product_name_hint: Hints.adventage_hint),
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: disadventage_controller,
                  product_name_hint: Hints.disadventage_hint),
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: notes1_controller,
                  product_name_hint: Hints.notes1_hint),
              CutomTextFaildNeeded(
                  precentage: 100,
                  type: 1,
                  size: size,
                  product: notes2_controller,
                  product_name_hint: Hints.notes2_hint),
              Row(
                children: [
                  CutomTextFaildNeeded(
                      precentage: 50,
                      type: 0,
                      size: size,
                      product: model_number_controller,
                      product_name_hint: Hints.model_number_hint),
                  CutomTextFaildNeeded(
                      precentage: 50,
                      type: 0,
                      size: size,
                      product: rating_controller,
                      product_name_hint: Hints.rating_hint),
                ],
              ),
              Row(
                children: [
                  CutomTextFaildNeeded(
                      precentage: 33,
                      type: 1,
                      size: size,
                      product: brand_controller,
                      product_name_hint: Hints.brand_hint),
                  CutomTextFaildNeeded(
                      precentage: 33,
                      type: 1,
                      size: size,
                      product: color_controller,
                      product_name_hint: Hints.color_hint),
                  CutomTextFaildNeeded(
                      precentage: 33,
                      type: 1,
                      size: size,
                      product: item_weight_controller,
                      product_name_hint: Hints.item_weight_hint),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CutomTextFaildNeeded(
                      precentage: 30,
                      type: 1,
                      size: size,
                      product: numberitem_controller,
                      product_name_hint: Hints.numberitem_hint),
                  MaterialButton(
                    onPressed: () async {
                      AwesomeDialog(
                          context: context,
                          keyboardAware: true,
                          dismissOnBackKeyPress: false,
                          dialogType: DialogType.info,
                          animType: AnimType.bottomSlide,
                          title:
                              'You will add ${numberitem_controller.text} from product ${product_name_controller.text}',
                          // padding: const EdgeInsets.all(5.0),
                          desc: 'now u will add jist clic okay buttom',
                          btnOkOnPress: () async {
                            print(int.parse(numberitem_controller.text));
                            for (int i = 0;
                                i < int.parse(numberitem_controller.text);
                                i++) {
                              var response = await _crud
                                  .postRequesr(AppUrl.insertProduct, {
                                "product_name": product_name_controller.text,
                                "image_url": image_url_controller.text,
                                "description": description_controller.text,
                                "department": department_controller.text,
                                "adminoruser": adminoruser_controller.text,
                                "adventage": adventage_controller.text,
                                "disadventage": disadventage_controller.text,
                                "notes1": notes1_controller.text,
                                "notes2": notes2_controller.text,
                                "rating": rating_controller.text,
                                "brand": brand_controller.text,
                                "model_number": model_number_controller.text,
                                "color": color_controller.text,
                                "item_weight": item_weight_controller.text,
                              });
                              print(response);
                            }
                          },
                          btnCancelOnPress: () {})
                        ..show();
                    },
                    child: Text("add product"),
                  ),
                ],
              )
            ]),
          ),
        ));
  }
}

class CutomTextFaildNeeded extends StatelessWidget {
  const CutomTextFaildNeeded({
    super.key,
    required this.size,
    required this.product,
    required this.product_name_hint,
    required this.type,
    required this.precentage,
  });

  final Size size;
  final TextEditingController product;
  final String product_name_hint;
  final int type;
  final double precentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuereyFun(size.width, precentage, 0),
      padding: EdgeInsets.symmetric(
          horizontal: mediaQuereyFun(size.width, 2, 0),
          vertical: mediaQuereyFun(size.height, .2, 1)),
      child: TextField(
        controller: product,
        keyboardType: type == 0 ? TextInputType.number : TextInputType.text,
        cursorColor: AppColor.black,
        style: const TextStyle(
            backgroundColor: AppColor.white,
            fontSize: 17,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: product_name_hint,
            filled: true,
            fillColor: AppColor.white,
            focusColor: AppColor.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2))),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';

String? valdator_function(String value, int type) {
  if (type == 1) //email
  {
    if (EmailValidator.validate(value)) {
      return null;
    } else {
      return "Invalid Email Example@mail.com";
    }
  } else if (type == 2) //password
  {
    if (value.length > 7) {
      return null;
    } else {
      return "Must value greater than 8 char";
    }
  } else if (type == 3) //text
  {
    if (value.isEmpty) {
      return "Must Enter Value";
    }
  } else {
    return null;
  }
}

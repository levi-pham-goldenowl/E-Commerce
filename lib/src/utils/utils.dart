import 'dart:math';

import 'package:e_commerce/src/utils/regex/regex.dart';
import 'package:intl/intl.dart';

class XUtils {
  static String formatPrice(double price) {
    String value = price.toString().replaceAll(XRegex.priceRegex, '');
    return value;
  }

  static String isValidEmail(String email) {
    email = email.trim();
    String message = "";

    bool emailValid = XRegex.emailRegex.hasMatch(email);
    if (emailValid == false) {
      message = "Invalid email";
    }
    if (email.isEmpty) {
      message = "Please enter valid email";
    }

    return message;
  }

  static String isValidPassword(String password) {
    password = password.trim();
    String message = "";

    if (password.length < 6 || password.length > 10) {
      message = "Password from 6 - 10 characters";
    }
    if (password.isEmpty) {
      message = "Please enter vaild password";
    }
    return message;
  }

  static String isValidName(String name) {
    String message = "";
    if (!name.contains(XRegex.nameVietnameseRegex)) {
      message = "Name cannot contain special characters or numbers";
    }
    if (name.isEmpty) {
      message = 'Please enter valid name';
    }
    return message;
  }

  static String isValidBirthDay(String day) {
    String message = "";
    if (day.isEmpty) {
      message = 'Please enter valid birth day';
    }
    return message;
  }

  static String dateTimeReview() {
    var date = DateTime.now();
    return DateFormat("MMMM d,yyyy").format(date);
  }

  static String isValidNamePaymentMethod(String name) {
    String message = "";
    if (name.isEmpty) {
      message = 'Please enter valid name';
    }
    return message;
  }

  static String isValidNameShippingAddress(String name) {
    String message = "";
    if (name.isEmpty) {
      message = 'Please enter valid name';
    }
    return message;
  }

  static String isValidAddress(String address) {
    String message = "";
    if (address.isEmpty) {
      message = 'Please enter valid address';
    }

    return message;
  }

  static String isValidCardNumber(String number) {
    String message = "";
    if (!number.contains(XRegex.onlyNumberRegex)) {
      message = "Card Numebr can only contain numbers";
    }
    if (number.isEmpty) {
      message = 'Please enter valid card number';
    }
    if (number.length != 16) {
      message = 'Invalid card number';
    }
    return message;
  }

  static String isValidCity(String city) {
    String message = "";
    if (!city.contains(XRegex.nameVietnameseRegex)) {
      message = "City cannot contain special characters or number";
    }
    if (city.isEmpty) {
      message = 'Please enter valid city';
    }

    return message;
  }

  static String isValidProvince(String province) {
    String message = "";
    if (!province.contains(XRegex.nameVietnameseRegex)) {
      message =
          "State/Province/Region cannot contain special characters or number";
    }
    if (province.isEmpty) {
      message = 'Please enter valid province';
    }

    return message;
  }

  static String isValidCVV(String cvv) {
    String message = "";
    if (!cvv.contains(XRegex.onlyNumberRegex)) {
      message = "CVV can only contain numbers";
    }
    if (cvv.isEmpty) {
      message = 'Please enter valid cvv';
    }
    if (cvv.length != 3) {
      message = 'Invalid zip cvv';
    }
    return message;
  }

  static String isValidZipCode(String zipCode) {
    String message = "";
    if (!zipCode.contains(XRegex.onlyNumberRegex)) {
      message = "Zip Code can only contain numbers";
    }
    if (zipCode.isEmpty) {
      message = 'Please enter valid zip code';
    }
    if (zipCode.length < 4) {
      message = 'Invalid zip code';
    }

    return message;
  }

  static String isValidCountry(String country) {
    String message = "";

    if (country.isEmpty) {
      message = 'Please enter valid country';
    }

    return message;
  }

  static String dateTimeNotification(DateTime date) {
    return DateFormat("MMMM d,yyyy").format(date);
  }

  static String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}

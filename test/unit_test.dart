// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:e_commerce/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Test Cases for Password', () {
    test('Password 5 char', () {
      expect(XUtils.isValidPassword("sign"), "Password from 6 - 10 characters");
    });
    test('Password 11 char', () {
      expect(XUtils.isValidPassword("123456789013123"),
          "Password from 6 - 10 characters");
    });
    test('Password is empty', () {
      expect(XUtils.isValidPassword(""), "Please enter vaild password");
    });
    test('Password valid', () {
      expect(XUtils.isValidPassword("123456"), "");
    });
    test('Password space', () {
      expect(XUtils.isValidPassword(" 12 3456 "), "");
    });
  });

  group('Test Cases for Email', () {
    test('Email does not contain . character', () {
      expect(XUtils.isValidEmail("levi@gmailcom"), "Invalid email");
    });
    test('Email does not contain @ character', () {
      expect(XUtils.isValidEmail("levi.gmail.com"), "Invalid email");
    });
    test('Email space', () {
      expect(XUtils.isValidEmail(" levi @ gmail . com "), "Invalid email");
    });
    test('Email is empty', () {
      expect(XUtils.isValidEmail(""), "Please enter valid email");
    });
    test('Email valid', () {
      expect(XUtils.isValidEmail("levi@gmail.com"), "");
    });
  });

  group('Test Cases for Name', () {
    test('Name only special character', () {
      expect(XUtils.isValidName("(*&"),
          "Name cannot contain special characters or numbers");
    });
    test('Name contain special character', () {
      expect(XUtils.isValidName("levi(*&"),
          "Name cannot contain special characters or numbers");
    });
    test('Name contain numbers ', () {
      expect(XUtils.isValidName("levi12312"),
          "Name cannot contain special characters or numbers");
    });
    test('Name only numbers ', () {
      expect(XUtils.isValidName("793792"),
          "Name cannot contain special characters or numbers");
    });

    test('Name is empty', () {
      expect(XUtils.isValidName(""), "Please enter valid name");
    });
    test('Name valid', () {
      expect(XUtils.isValidName("levi"), "");
    });
    test('Name contain char space', () {
      expect(XUtils.isValidName("levi main"), "");
    });
  });
}

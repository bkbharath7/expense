// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Functions extends ChangeNotifier {
  int balance = 0;
  int income = 0;
  int expence = 0;
  List<String> transactions = [];
 
  void addition(int add) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Income", income += add);
    prefs.setInt("Balance", balance += add);
    notifyListeners();
  }

  void substraction(int sub) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("Expense", expence += sub);
    prefs.setInt("Balance", balance -= sub); 
    notifyListeners();
  }

  void getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    income = prefs.getInt("Income") ?? 0;
    expence = prefs.getInt("Expense") ?? 0;
    balance = prefs.getInt("Balance") ?? 0;
    transactions = prefs.getStringList("Historylist")!;
    notifyListeners();
  }

  void savelist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    transactions = prefs.getStringList("Historylist")!;
    notifyListeners();
  }

  void erasedata() async {
    final prefs = await SharedPreferences.getInstance();
    income = 0;
    expence = 0;
    balance = 0;
    transactions.clear();
    prefs.clear();
    notifyListeners();
  }

 bool isswitched = false;
  void operator1(value) {
    isswitched = value;
    notifyListeners();
  }

  bool ischanged = false;
  void operator2(value) {
    ischanged = value;
    notifyListeners();
  }

  String selecteditem = "Food";
  void operator3(newValue) {
    selecteditem = newValue;
    notifyListeners();
  }

  String selecteditem1 = "Salary";
  void operator4(newValue) {
    selecteditem1 = newValue;
  }

  String selectedvalue = "January";
  void operator5(newValue) {
    selectedvalue = newValue;
  }
}
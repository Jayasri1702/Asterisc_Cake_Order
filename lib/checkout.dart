//This is the delivery form where the package is to be sent
//it will be a form
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'package:mailer/smtp_server/gmail.dart';
import 'package:cake/data.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var shipping = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  late DateTime time;

  //send mail function
  Future<void> sendmail(
      var price, var location, var name, var userEmail) async {
    try {
      time = DateTime.now().add(Duration(minutes: 30));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[700],
          content: Text("Ordered...Order details have been sent to email"),
          duration: Duration(seconds: 6),
        ),
      );
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[700],
          content: Text(e.toString()),
          duration: Duration(milliseconds: 2000),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Now ${Data.itemselected}"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Hero(
              tag: Data.itemselected,
              child: Image(
                image: AssetImage("images/${Data.itemselected}.jpg"),
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 20,
          ),
          Text(Data.itemselected,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formkey,
              child: Center(
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: name,
                    validator: (value) {
                      if (value == null) {
                        return "Can not be empty";
                      }
                      if (value.isEmpty) {
                        return "Can not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Your address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: shipping,
                    validator: (value) {
                      if (value == null) {
                        return "Can not be empty";
                      }
                      if (value.isEmpty) {
                        return "Can not be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: phone,
                    validator: (value) {
                      if (value == null) {
                        return "Can not be empty";
                      }
                      if (value.isEmpty) {
                        return "Can not be empty";
                      }
                      if (value.length < 10) {
                        return "Please enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    controller: email,
                    validator: (value) {
                      if (value == null) {
                        return "Can not be empty";
                      }
                      if (value.isEmpty) {
                        return "Can not be empty";
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text("Total amount :${Data.total} " + "Rs",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35)),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton.icon(
                    onPressed: () async {
                      //check all fields are filled
                      if (formkey.currentState!.validate()) {
                        //send email with shipment details
                        await sendmail(
                            Data.total, shipping.text, name.text, email.text);
                        //clear fields
                        shipping.clear();
                        name.clear();
                        phone.clear();
                        email.clear();
                      }
                    },
                    icon: Icon(Icons.local_shipping),
                    label: Text("Order Now"),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
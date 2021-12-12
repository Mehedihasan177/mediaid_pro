import 'package:care_plus/views/screens/confirm_appointment/confirm_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ConfirmaAppointment()));
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ConfirmaAppointment()));
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        "Payment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            screenDesign(),
          ],
        ),
      ),
    );
  }
}

screenDesign() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
            alignment: Alignment.topLeft,
            child: Text("Enter amount to add",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 70,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text("\$200",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Container(
          alignment: Alignment.topLeft,
          child: Text("Add money via",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 80,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: Icon(Icons.credit_card_outlined, color: Colors.green,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Wallet",
                  style: TextStyle(
                    fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 80,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: Icon(Icons.attach_money, color: Colors.green,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Cash On Delivery",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 80,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: Image.asset("images/paypal.png",
                height: 25,
                  width: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Paypal",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 80,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: Image.asset("images/payumoney-logo.png",
                height: 25,
                  width: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("PayU Money",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        height: 80,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,),
                child: Image.asset("images/stripe_payment.png",
                height: 25,
                  width: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Wallet",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}


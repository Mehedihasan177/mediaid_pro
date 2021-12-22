import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({Key? key}) : super(key: key);

  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {

  TextEditingController _gatewayC = TextEditingController();
  TextEditingController _noteC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recharge Wallet'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Please Enter Transaction Gateway',style: TextStyle(fontSize: 16),),
            SizedBox(height: 5,),
            TextField(
              controller: _gatewayC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: 'Please Enter Transaction Gateway',
                  // helperText: '',
                  labelText: 'Payment Gateway',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  prefixText: ' ',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),

            SizedBox(height: 5,),
            Text('Please Enter Transaction Gateway',style: TextStyle(fontSize: 16),),
            SizedBox(height: 5,),
            TextField(
              controller: _noteC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: 'Please Enter Transaction Details',
                  helperText: 'Please Pay to our Bank Accounts and share details here',
                  labelText: 'Transaction Details',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  prefixText: ' ',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}

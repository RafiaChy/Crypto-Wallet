import 'package:flutter/material.dart';
import 'package:my_crypto_wallet/internet/flutterfire.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    'bitcoin',
    'tether',
    'ethereum',
  ];

  String dropdownValue = 'bitcoin';
  TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Crypto Wallet'),
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
        child: Column(
          children: [
            DropdownButton(
              value: dropdownValue,
              onChanged: (String value) {
                setState(() {
                  dropdownValue = value;
                });
              },
              items: coins.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Coin Amount',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.green[900],
              ),
              child: MaterialButton(
                onPressed: () async {
                  await addCoins(dropdownValue, _amountController.text);
                  Navigator.of(context).pop();
                },
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

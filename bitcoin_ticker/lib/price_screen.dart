import 'package:bitcoin_ticker/constants.dart';
import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  static String selectedCurrency = 'USD';
  double btcRate = 0.0;
  double ethRate = 0.0;
  double ltcRate = 0.0;
  String currBtcUrl = "v1/exchangerate/BTC/$selectedCurrency";
  String currEthUrl = "v1/exchangerate/ETH/$selectedCurrency";
  String currLtcUrl = "v1/exchangerate/LTC/$selectedCurrency";
  void getPrice() async {
    var nwBtc = NetworkHelper(
      url: Uri.http(baseUrl, currBtcUrl, {"apiKey": apiKey}),
    );
    var btcData = await nwBtc.getData();
    var nwEth = NetworkHelper(
      url: Uri.http(baseUrl, currEthUrl, {"apiKey": apiKey}),
    );
    var ethData = await nwEth.getData();
    var nwLtc = NetworkHelper(
      url: Uri.http(baseUrl, currLtcUrl, {"apiKey": apiKey}),
    );
    var ltcData = await nwLtc.getData();
    setState(() {
      btcRate = btcData['rate'];
      ethRate = ethData['rate'];
      ltcRate = ltcData['rate'];
    });
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ${btcRate.toStringAsFixed(2)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = ${ethRate.toStringAsFixed(2)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = ${ltcRate.toStringAsFixed(2)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                value: selectedCurrency,
                items: getDropdownItems(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value ?? 'USD';
                    getPrice();
                  });
                }),
          ),
        ],
      ),
    );
  }
}

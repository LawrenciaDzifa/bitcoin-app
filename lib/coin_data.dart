import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bitcoin_ticker/price_screen.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '656F6F6C-D8B0-4BEE-AFAE-2872837BBAA2';

class CoinData {
  //Create your getCoinData() method here.
  Future getCoinData(selectedCurrency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(
      Uri.parse('$requestURL'),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var price = jsonData['rate'];
              cryptoPrices[crypto] = price.toStringAsFixed(0);

    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    }
    return cryptoPrices;
  }
}

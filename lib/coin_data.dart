import 'dart:convert';
import 'package:http/http.dart' as http;

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
  Future getCoinData() async {
   String url = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var rate = jsonData['rate'];
      return rate;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}


import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin_detail.dart';

abstract class AbstarctCoinsRepositories {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetail> getCoinsDetails(String currencyCode);
}
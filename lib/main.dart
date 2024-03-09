import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/crypto_coins_list_app.dart';
import 'package:flutter_application_1/repositories/crypto_coins/abstract_coin_repositories.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins_repositories.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstarctCoinsRepositories>(
      () => CryptoCoinsRepositories(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}

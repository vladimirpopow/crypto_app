import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTail extends StatelessWidget {
  const CryptoCoinTail({
    super.key,
    required this.coin,
    required this.theme
    
  });

  final CryptoCoin coin;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imageURL),
      title:  Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle:  Text(
        "${coin.priceUsd}\$",
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
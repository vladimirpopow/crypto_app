import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.imageURL,
    required this.name,
    required this.priceUsd,
  });

  final String name;
  final double priceUsd;
  final String imageURL;
  
  @override
  List<Object> get props => [name, priceUsd, imageURL];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/crypto_coins/abstract_coin_repositories.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepositories) : super(CryptoListInitial()) {
    on<LoadCryptolist>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
 
        final coinsList = await coinsRepositories.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      }
    });
  }

  final AbstarctCoinsRepositories coinsRepositories;
}

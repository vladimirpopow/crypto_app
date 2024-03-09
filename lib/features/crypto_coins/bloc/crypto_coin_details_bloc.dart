// import 'package:flutter_application_1/features/crypto_coins/bloc/crypto_coin_details_event.dart';
// import 'package:flutter_application_1/features/crypto_coins/bloc/crypto_coin_details_event.dart';
// import 'crypto_coin_details_event.dart';
// import 'package:flutter_application_1/features/crypto_lists/block/crypto_list_bloc.dart';
// import 'package:flutter_application_1/repositories/crypto_coins/abstract_coin_repositories.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

// import 'crypto_coin_details_event.dart';
// import 'crypto_coin_details_event.dart';

// class CryptoCoinDetailsBloc extends Bloc<CryptoCoinDetailsEvent, CryptoCoinDetailsState> {
//   CryptoCoinDetailsBloc(this.coinsRepositories) : super(CryptoCoinDetailsInitial()) {
//     on<LoadCryptolist>(_load);
//   }

//   final AbstarctCoinsRepositories coinsRepositories;


//   Future<void> _load (
//     LoadCryptoCoinDetails event,
//     Emitter<CryptoCoinDetailsState> emit,
//   ) async {
//     try {
//       if(state is! CryptoCoinDetailsLoaded) {
//         emit(CryptoListLoading());
      
//       }
//       final coinDetails = await coinsRepositories.getCoinsDetails(event.currencyCode);
//       emit(CryptoListLoaded(coinDetails));
//     } catch (e) {
//       emit(CryptoListLoadingFailure(e));
      
//     }
//   }
// }
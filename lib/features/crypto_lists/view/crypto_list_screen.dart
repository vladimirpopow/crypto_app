import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/crypto_lists/block/crypto_list_bloc.dart';
import 'package:flutter_application_1/features/crypto_lists/widgets/crypto_coinTail.dart';
import 'package:flutter_application_1/repositories/crypto_coins/abstract_coin_repositories.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coins_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphic/graphic.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstarctCoinsRepositories>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptolist());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Криптовалюта")),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _cryptoListBloc.add(LoadCryptolist());
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                    itemCount: state.coinsList.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      final coin = state.coinsList[i];

                      return CryptoCoinTail(
                        coin: coin,
                        theme: ThemeData.dark(),
                      );
                    });
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    children: [
                      const Text(
                        "Ooops....=(",
                      ),
                      const Text("Please try againg later"),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptolist());
                          },
                          child: const Text('Try againg')),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
        //  (_cryptoCoinsList == null)
        //     ? Center(child: const CircularProgressIndicator())
        //     : ListView.separated(
        //         itemCount: _cryptoCoinsList!.length,
        //         separatorBuilder: (context, index) => const Divider(),
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinsList![i];

        //           return CryptoCoinTail(
        //             coin: coin,
        //             theme: ThemeData.dark(),
        //           );
        //         }),
        );
  }

  // Future<void> _loadCryptoCoins() async{
  //   _cryptoCoinsList = await GetIt.I<AbstarctCoinsRepositories>().getCoinsList();
  // }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;
//  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstarctCoinsRepositories>());
  @override
  void didChangeDependencies() {
    setState(() {});
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      log('you mast provide args');
      return;
    }
    if (args is! String) {
      log('you mast provide args');
      return;
    }
    coinName = args;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 69, 223),
      appBar: AppBar(
        title: Text(coinName ?? '...'),
        
      ),
      // ignore: prefer_const_constructors
      
    );
  }
}

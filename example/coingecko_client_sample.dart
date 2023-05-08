import 'package:coingecko_client/coingecko_client.dart';

void main() async {
    try {
        final client = CoinGeckoClient();
        final coinHistory = await client.coins.getHistory(
            id: 'bitcoin',
            date: DateTime.now()
        );
        print(coinHistory);
        print(coinHistory.name);

    } on Exception catch (e, _) {
        /// Exception handling
        /// All runtime exceptions will go here.
        /// All http status code other than 200 will also be here.
        /// [Sample error handling]
        print("error occured");
        if(e is NetworkRequestException) {
            print(e.statusCode);
        } else {
            rethrow;
        }
    }
}
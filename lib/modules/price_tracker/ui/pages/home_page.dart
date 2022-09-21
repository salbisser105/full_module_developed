import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import '../../models/coin_model.dart';
import 'package:tracker_test_package/tracker_test_package.dart';

class HomePagePriceTracker extends StatefulWidget {
  const HomePagePriceTracker({Key? key}) : super(key: key);

  @override
  State<HomePagePriceTracker> createState() => _HomePagePriceTrackerState();
}

class _HomePagePriceTrackerState extends State<HomePagePriceTracker> {
  TrackerTestPackage helpers = TrackerTestPackage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: GestureDetector(
              onTap: (() {
                SystemNavigator.pop();
              }),
              child: Icon(Icons.arrow_back_ios)),
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: Text(
            'Crypto Tracker',
            style: TextStyle(
                color: Colors.grey[900],
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List<Coin>>(
            future: helpers.fetchCoin(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return Scrollbar(
                thumbVisibility: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        return CoinCardWidget(
                          name: data![index].name,
                          symbol: data[index].symbol,
                          imageUrl: data[index].imageUrl,
                          price: data[index].price.toDouble(),
                          change: data[index].change.toDouble(),
                          changePercentage:
                              data[index].changePercentage.toDouble(),
                        );
                      }),
                ),
              );
            }));
  }
}

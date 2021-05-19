import 'package:flutter/material.dart';
import 'package:scan_zeit/core/misc/constants.dart';

class MerchantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () => {})],
        centerTitle: true,
        title: Text(
          'Scan-Zeit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: kColorScheme[50],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '5 Visits',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                    ),
                    Text(
                      '19/05/2021',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: kColorScheme[50],
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 40.0,
                      color: kColorScheme[900],
                    ),
                    title: Text('Shaop name $index'),
                    subtitle: Text('Visited 10AM Today'),
                    trailing: Icon(
                      Icons.chevron_right_outlined,
                      size: 40.0,
                      color: kColorScheme[900],
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_scanner_rounded),
        onPressed: () => {},
      ),
    );
  }
}

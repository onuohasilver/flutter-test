import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:renmoney_flutter_test/modules/entry/screens/home.dart';
import 'package:renmoney_flutter_test/modules/transactions/controllers/transaction_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Renmoney Flutter Test',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "ProductSans"),
        home: const Entry(),
      ),
    );
  }
}

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return const Home();
  }
}

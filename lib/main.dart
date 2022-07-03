import 'package:flutter/material.dart';
import 'package:flutter_app/base_provider.dart';
import 'package:flutter_app/base_response.dart';
import 'package:flutter_app/test_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TestProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TestProvider>(
        builder: (ctx, testProvider, child) {
          if (testProvider.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (testProvider.status == Status.DONE) {
            BaseResponse? response = testProvider.response;
            if (testProvider.errorMessage.isNotEmpty) {
              return Center(child: Text(testProvider.errorMessage),);
            }
            return Center(child: Text(response?.data));
          }

          return const Center(child: Text('Empty'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TestProvider>().getData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

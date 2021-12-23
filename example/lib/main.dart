import 'package:flutter/material.dart';
import 'package:idkit_ip/idkit_ip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Get user's public network ip"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Public network IPv4'),
            const SizedBox(height: 10),
            StreamBuilder<String>(
              stream: IDKitIp.getIPv4().asStream(),
              builder: (_, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Obtaining user's public network ip in progress...");
                }

                if (snapshot.hasError) {
                  return const Text("Failed to get the user's public network ip");
                }
                return Text('Public-IPv4:   ' + snapshot.data!);
              },
            ),
            StreamBuilder<String>(
              stream: IDKitIp.getIPv4(format: IPFormat.json).asStream(),
              builder: (_, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Obtaining user's public network ip in progress...");
                }

                if (snapshot.hasError) {
                  return const Text("Failed to get the user's public network ip");
                }
                return Text('Public-IPv4-JSON:   ' + snapshot.data!);
              },
            ),
            const SizedBox(height: 20),
            const Text('Public network IPv6'),
            const SizedBox(height: 10),
            StreamBuilder<String>(
              stream: IDKitIp.getIPv6().asStream(),
              builder: (_, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Obtaining user's public network ip in progress...");
                }

                if (snapshot.hasError) {
                  return const Text("Failed to get the user's public network ip");
                }
                return Text('Public-IPv6:   ' + snapshot.data!);
              },
            ),
            StreamBuilder<String>(
              stream: IDKitIp.getIPv6(format: IPFormat.json).asStream(),
              builder: (_, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Obtaining user's public network ip in progress...");
                }

                if (snapshot.hasError) {
                  return const Text("Failed to get the user's public network ip");
                }
                return Text('Public-IPv6-JSON:  ' + snapshot.data!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

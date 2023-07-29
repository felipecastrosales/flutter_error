import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.red,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Something is not right here...',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Flutter Error Page',
      home: const MyHomePage(),
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };

        if (widget == null) {
          return const SizedBox.shrink();
        }

        return widget;
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: <Widget>[
          Text(
            'Welcome,',
            style: Theme.of(context).textTheme.titleLarge,
          ),

          // This will throw an error
          const FirstName(),
          // const FirstName(firstName: 'John'), // This will not throw an error
        ],
      ),
    );
  }
}

class FirstName extends StatelessWidget {
  const FirstName({
    super.key,
    this.firstName,
  });

  final String? firstName;

  @override
  Widget build(BuildContext context) {
    return Text(firstName!);
  }
}

import 'package:flutter/material.dart';
import 'api_call.dart';
import 'form.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Page de connexion M2L',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.yellowAccent[100],
        titleTextStyle:
            const TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
      ),
      backgroundColor: Colors.yellowAccent[100],
      body: const Center(child: MyCustomForm()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Users> users;

  @override
  void initState() {
    super.initState();
    users = Users.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Seance"),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Users>(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: 350,
                  height: 50,
                  color: Colors.green,
                  child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data!.name,),
                    Text(snapshot.data!.username),
                    Text(snapshot.data!.date_seance),
                  ],
                )
                );               
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

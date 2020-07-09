import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_hair/constants/loading.dart';
import 'package:go_hair/pages/auth/isAuthenticated.dart';
import 'package:provider/provider.dart';


class AddRdvPage extends StatefulWidget {
  AddRdvPage({Key key}) : super(key: key);
  final String title = 'Prendre un rendez-vous';

  @override
  _AddRdvPageState createState() => _AddRdvPageState();
}

class _AddRdvPageState extends State<AddRdvPage> {

  String name;
  int phone;
  String email;

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Authentificated>(context);

    GetCurrentUserDatas(id: user.id).userData.forEach((snapshot) {
      this.name = snapshot.name;
      this.phone = snapshot.phone;
      this.email = snapshot.email;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Front Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (this.isLoading == true) ? SimpleLoading()
                        : Text('Bienvenue'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onLogout() async {
    setState((){
      this.isLoading = true;
    });

    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();

    print('Successs');
    setState((){
      this.isLoading = false;
    });

  }
}

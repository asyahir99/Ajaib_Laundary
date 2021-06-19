import 'package:ajaib_laundary/Screen/Laundry/list/list.dart';
import 'package:ajaib_laundary/Screen/Login/login.dart';
import 'package:ajaib_laundary/main/mainScreen.dart';
import 'package:ajaib_laundary/services/auth.dart';
import 'package:provider/provider.dart';
//import 'package:ajaib_laundary/Screen/Laundry/list/background.dart';
import 'dart:convert';

import 'list.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AJAIB LAUNDRY'),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(title: Text('TBD'), onTap: () {}),
            ListTile(
                title: Text('logout'),
                onTap: () {
                  context.read<AuthServices>().signOut();
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => MainScreen()),
                    ModalRoute.withName('/'),
                  );
                  ;
                })
          ],
        )),
        body: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/laundry.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var newData = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, bottom: 32, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  newData[index]['title'],
                                  //'Note Title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              Text(
                                newData[index]['text'],
                                //'Note Text',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },
          ),
        ));
  }
}

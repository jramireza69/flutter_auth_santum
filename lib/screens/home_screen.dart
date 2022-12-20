import 'dart:ui';

import 'package:auth_santum/screens/login_screen.dart';
import 'package:auth_santum/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenState extends StatefulWidget {
  const HomeScreenState({super.key});

  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter laravel authr'),
        ),
        body: const Center(child: Text('Home Screeen')),
        drawer: Drawer(child: Consumer<Auth>(builder: (context, auth, child) {
          if (!auth.autenticated) {
            return ListView(
              children: [
                ListTile(
                  title: const Text('login'),
                  leading: const Icon(Icons.login),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                ),
              ],
            );
          } else {
            return ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Jaime Ramirez',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'admin@mail.com',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Logout'),
                  leading: const Icon(Icons.logout),
                  onTap: () {
                    Provider.of<Auth>(context, listen: false).logout();
                  },
                ),
              ],
            );
          }
        })));
  }
}

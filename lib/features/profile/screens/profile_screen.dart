import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Profil"),

      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: const [

          CircleAvatar(

            radius: 45,

            child: Icon(

              Icons.person,

              size: 50,

            ),

          ),

          SizedBox(height: 20),

          Center(

            child: Text(

              "Utilisateur BadWallet",

              style: TextStyle(

                fontWeight: FontWeight.bold,

                fontSize: 22,

              ),

            ),

          ),

          SizedBox(height: 40),

          ListTile(

            leading: Icon(Icons.phone),

            title: Text("Téléphone"),

          ),

          Divider(),

          ListTile(

            leading: Icon(Icons.email),

            title: Text("Adresse email"),

          ),

          Divider(),

          ListTile(

            leading: Icon(Icons.logout),

            title: Text("Déconnexion"),

          ),

        ],

      ),

    );

  }

}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../helpers/auth/auth_helpers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: 'https://img.freepik.com/vecteurs-libre/creation-logo-local-magasin-dessine-main_23-2149575766.jpg?w=2000', // Remplacez l'URL par celle de votre logo
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 100,
                  height: 100,
                ),
              ),
              // Text: Welcome!
              Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Text: Please login or sign up to continue our app
              Text(
                'Please login or sign up to continue our app',
                style: TextStyle(fontSize: 11),
              ),
              SizedBox(height: 16),
              // Text: Email
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // TextField: Email
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Text: Password
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // TextField: Password
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Button: Login
              Container(
                width: double.infinity, // Prendre toute la largeur disponible
                child: ElevatedButton(
                  onPressed: () {
                    // Action when login button is pressed
                    navigateToHomePage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 8),
              // Button: Sign in
              Container(
                width: double.infinity, // Prendre toute la largeur disponible
                child: ElevatedButton(
                  onPressed: () {
                    navigateToRegisterPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text('Sign in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
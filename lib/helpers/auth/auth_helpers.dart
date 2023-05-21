// Importez le package flutter/material.dart si cela n'a pas déjà été fait

// Fonction pour naviguer vers la page d'accueil (homepage)
import 'package:flutter/material.dart';

void navigateToHomePage(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/home'); // Remplacez '/home' par le nom de la route de votre page d'accueil
}

// Fonction pour naviguer vers la page d'inscription (register)
void navigateToRegisterPage(BuildContext context) {
  Navigator.pushNamed(context, '/register'); // Remplacez '/register' par le nom de la route de votre page d'inscription
}
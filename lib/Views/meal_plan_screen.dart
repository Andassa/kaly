import 'package:flutter/material.dart';
import 'package:flutter_complete_app/Utils/constants.dart';
import 'package:iconsax/iconsax.dart';

// Exemple de données pour les repas (peut être remplacé par des données dynamiques)
final List<Map<String, dynamic>> mealPlans = [
  {
    'title': 'Salade César',
    'time': '20 Min',
    'calories': '300 Cal',
    'isFavorite': false,
  },
  {
    'title': 'Poulet Grillé',
    'time': '45 Min',
    'calories': '600 Cal',
    'isFavorite': true,
  },
  {
    'title': 'Pâtes Carbonara',
    'time': '30 Min',
    'calories': '700 Cal',
    'isFavorite': false,
  },
  {
    'title': 'Smoothie Énergétique',
    'time': '10 Min',
    'calories': '150 Cal',
    'isFavorite': true,
  },
  {
    'title': 'Omelette aux Champignons',
    'time': '15 Min',
    'calories': '250 Cal',
    'isFavorite': false,
  },
];

class MealPlanScreen extends StatefulWidget {
  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        centerTitle: true,
        title: const Text(
          "Meal Plan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add, color: kprimaryColor),
            onPressed: () {
              // Action pour ajouter un nouveau plan de repas
              _showAddMealDialog(context);
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: mealPlans.length,
        itemBuilder: (context, index) {
          final meal = mealPlans[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: kprimaryColor.withOpacity(0.2),
                  child: const Icon(
                    Iconsax.book,
                    color: kprimaryColor,
                    size: 30,
                  ),
                ),
                title: Text(
                  meal['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Row(
                  children: [
                    const Icon(
                      Iconsax.clock,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      meal['time'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      " · ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(
                      Iconsax.flash_1,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      meal['calories'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    meal['isFavorite'] ? Iconsax.heart5 : Iconsax.heart,
                    color: meal['isFavorite'] ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    // Ajouter ou supprimer des favoris
                    setState(() {
                      meal['isFavorite'] = !meal['isFavorite'];
                    });
                  },
                ),
                onTap: () {
                  // Action pour ouvrir les détails du plan de repas
                  _showMealDetails(context, meal);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Boîte de dialogue pour ajouter un nouveau repas (Mockup)
  void _showAddMealDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ajouter un nouveau plan de repas'),
          content: const Text('Fonctionnalité à venir...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  // Affichage des détails d'un repas (Mockup)
  void _showMealDetails(BuildContext context, Map<String, dynamic> meal) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(meal['title']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Temps de préparation : ${meal['time']}'),
              const SizedBox(height: 10),
              Text('Calories : ${meal['calories']}'),
              const SizedBox(height: 20),
              const Text('Détails du repas...'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}

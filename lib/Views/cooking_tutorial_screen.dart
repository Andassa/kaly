import 'package:flutter/material.dart';

class CookingTutorialScreen extends StatefulWidget {
  final List<TutorialStep> tutorialSteps;

  const CookingTutorialScreen({Key? key, required this.tutorialSteps}) : super(key: key);

  @override
  _CookingTutorialScreenState createState() => _CookingTutorialScreenState();
}

class _CookingTutorialScreenState extends State<CookingTutorialScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutoriel de Cuisine"),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.tutorialSteps.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final step = widget.tutorialSteps[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image de l'étape
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(step.imageUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  step.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  step.description,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Afficher le numéro d'étape
                Text("Étape ${index + 1} sur ${widget.tutorialSteps.length}"),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Bouton Précédent
            TextButton(
              onPressed: _currentIndex > 0
                  ? () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
                  : null,
              child: const Text("Précédent"),
            ),
            // Bouton Suivant
            TextButton(
              onPressed: _currentIndex < widget.tutorialSteps.length - 1
                  ? () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
                  : () {
                Navigator.pop(context);
              },
              child: Text(_currentIndex < widget.tutorialSteps.length - 1 ? "Suivant" : "Terminer"),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialStep {
  final String title;
  final String description;
  final String imageUrl;

  TutorialStep({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

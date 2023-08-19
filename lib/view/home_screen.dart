import 'package:flutter/material.dart';
import 'package:trneeb_counter/core/buttons/circular_button.dart';
import 'package:trneeb_counter/view/counter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedFinalScore = 31; // Default selected final score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarneeb Counter'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Select Final Score',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularButton(
                    title: '31',
                    value: 31,
                    selectedValue: _selectedFinalScore,
                    onPressed: () {
                      setState(() {
                        _selectedFinalScore = 31;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  CircularButton(
                    title: '41',
                    value: 41,
                    selectedValue: _selectedFinalScore,
                    onPressed: () {
                      setState(() {
                        _selectedFinalScore = 41;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  CircularButton(
                    title: '61',
                    value: 61,
                    selectedValue: _selectedFinalScore,
                    onPressed: () {
                      setState(() {
                        _selectedFinalScore = 61;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen with the selected final score
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TarneebCounterPage(finalScore: _selectedFinalScore),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


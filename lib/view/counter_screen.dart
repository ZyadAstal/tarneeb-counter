import 'package:flutter/material.dart';

class TarneebCounterPage extends StatefulWidget {
  final int finalScore;

  const TarneebCounterPage({Key? key, required this.finalScore})
      : super(key: key);

  @override
  _TarneebCounterPageState createState() => _TarneebCounterPageState();
}

class _TarneebCounterPageState extends State<TarneebCounterPage> {
  TextEditingController teamAScoreController = TextEditingController();
  TextEditingController teamBScoreController = TextEditingController();

  int teamAScore = 0;
  int teamBScore = 0;

  void _showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Winner'),
          content: Text('$winner is the winner!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the home screen
              },
              child: const Text('Back to Home'),
            ),
          ],
        );
      },
    );
  }

  void _updateScores() {
    setState(() {
      int newTeamAScore = int.tryParse(teamAScoreController.text) ?? 0;
      int newTeamBScore = int.tryParse(teamBScoreController.text) ?? 0;

      teamAScore += newTeamAScore;
      teamBScore += newTeamBScore;

      teamAScoreController.text = '';
      teamBScoreController.text = '';

      if (determineWinnerTeam() != 'No Winner Yet') {
        _showWinnerDialog(determineWinnerTeam());
      }
    });
  }

  void _resetScores() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
      teamAScoreController.text = '';
      teamBScoreController.text = '';
    });
  }

  String determineWinnerTeam() {
    if (teamAScore >= widget.finalScore && teamAScore > teamBScore) {
      return 'Team A';
    } else if (teamBScore >= widget.finalScore && teamBScore > teamAScore) {
      return 'Team B';
    } else {
      return 'No Winner Yet';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarneeb Counter'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildScoreCard('Team A', teamAScore),
                _buildScoreCard('Team B', teamBScore),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildScoreTextField('Enter Score', teamAScoreController),
                _buildScoreTextField('Enter Score', teamBScoreController),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateScores,
              child: const Text('Update Scores'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _resetScores,
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // Set the button's text color
              ),
              child: const Text('Reset Scores'),
            ),
            const SizedBox(height: 20),
            if (determineWinnerTeam() != 'No Winner Yet')
              Column(
                children: [
                  Text(
                    '${determineWinnerTeam()} is the winner!',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate back to the first screen
                      Navigator.pop(context);
                    },
                    child: const Text('Back to Home'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(String teamName, int score) {
    return Card(
      color: Colors.teal,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              teamName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              score.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreTextField(String hint, TextEditingController controller) {
    return SizedBox(
      width: 120,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.teal),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.teal),
          ),
        ),
      ),
    );
  }
}

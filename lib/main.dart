import 'package:flutter/material.dart';

void main() {
  runApp(GradeEntryApp());
}

class GradeEntryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Entry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GradeEntryScreen(),
    );
  }
}

class GradeEntryScreen extends StatefulWidget {
  @override
  _GradeEntryScreenState createState() => _GradeEntryScreenState();
}

class _GradeEntryScreenState extends State<GradeEntryScreen> {
  TextEditingController mathController = TextEditingController();
  TextEditingController scienceController = TextEditingController();
  TextEditingController englishController = TextEditingController();
  TextEditingController historyController = TextEditingController();

  String grade = '';

  void calculateGrade() {
    double math = double.tryParse(mathController.text) ?? 0;
    double science = double.tryParse(scienceController.text) ?? 0;
    double english = double.tryParse(englishController.text) ?? 0;
    double history = double.tryParse(historyController.text) ?? 0;

    double totalMarks = math + science + english + history;
    double averageMarks = totalMarks / 4;

    if (averageMarks >= 90) {
      setState(() {
        grade = 'A+';
      });
    } else if (averageMarks >= 80) {
      setState(() {
        grade = 'A';
      });
    } else if (averageMarks >= 70) {
      setState(() {
        grade = 'B';
      });
    } else if (averageMarks >= 60) {
      setState(() {
        grade = 'C';
      });
    } else if (averageMarks >= 50) {
      setState(() {
        grade = 'D';
      });
    } else {
      setState(() {
        grade = 'F';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Entry'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: mathController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Math Marks',
              ),
            ),
            TextField(
              controller: scienceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Science Marks',
              ),
            ),
            TextField(
              controller: englishController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'English Marks',
              ),
            ),
            TextField(
              controller: historyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'History Marks',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateGrade();
              },
              child: Text('Calculate Grade'),
            ),
            SizedBox(height: 20),
            Text(
              'Grade: $grade',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


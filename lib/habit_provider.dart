import 'package:flutter/foundation.dart';
import 'models/habit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HabitProvider with ChangeNotifier {
  List<Habit> _habits = [];

  List<Habit> get habits => _habits;

  void addHabit(Habit habit) {
    _habits.add(habit);
    saveData();
    notifyListeners();
  }

  void toggleCompletion(int index) {
    _habits[index].isCompleted = !_habits[index].isCompleted;
    saveData();
    notifyListeners();
  }

  void removeHabit(int index) {
    _habits.removeAt(index);
    saveData();
    notifyListeners();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? habitsJson = prefs.getString('habits');
    if (habitsJson != null) {
      List<dynamic> decodedHabits = jsonDecode(habitsJson);
      _habits = decodedHabits.map((item) => Habit.fromJson(item)).toList();
      notifyListeners();
    }
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String habitsJson =
        jsonEncode(_habits.map((habit) => habit.toJson()).toList());
    prefs.setString('habits', habitsJson);
  }
}

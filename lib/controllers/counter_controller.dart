import 'package:flutter/material.dart';
import '../models/counter_model.dart';
import '../services/shared_preferences_service.dart';

class CounterController extends ChangeNotifier {
  List<CounterModel> _counters = [];
  final SharedPreferencesService _prefsService = SharedPreferencesService();

  List<CounterModel> get counters => _counters;

  CounterController() {
    _loadCounters();
  }

  Future<void> _loadCounters() async {
    _counters = await _prefsService.loadCounters();
    notifyListeners();
  }

  Future<void> _saveCounters() async {
    await _prefsService.saveCounters(_counters);
  }

  Future<void> addCounter(String name, int colorValue) async {
    _counters.add(CounterModel(name: name, colorValue: colorValue));
    await _saveCounters();
    notifyListeners();
  }

  Future<void> incrementCounter(int index) async {
    _counters[index].value++;
    await _saveCounters();
    notifyListeners();
  }

  Future<void> decrementCounter(int index) async {
    if (_counters[index].value > 0) {
      _counters[index].value--;
      await _saveCounters();
      notifyListeners();
    }
  }

  Future<void> resetCounter(int index) async {
    _counters[index].value = 0;
    await _saveCounters();
    notifyListeners();
  }

  Future<void> deleteCounter(int index) async {
    _counters.removeAt(index);
    await _saveCounters();
    notifyListeners();
  }

  Future<void> clearAllCounters() async {
    _counters.clear();
    await _prefsService.clearCounters();
    notifyListeners();
  }
}
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/counter_model.dart';

class SharedPreferencesService {
  static const String _countersKey = 'counters';

  Future<List<CounterModel>> loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_countersKey);
    
    if (data == null) return [];
    
    try {
      final decoded = jsonDecode(data) as List;
      return decoded.map((e) => CounterModel.fromJson(e)).toList();
    } catch (e) {
      print('Error loading counters: $e');
      return [];
    }
  }

  Future<void> saveCounters(List<CounterModel> counters) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(counters.map((e) => e.toJson()).toList());
    await prefs.setString(_countersKey, encoded);
  }

  Future<void> clearCounters() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_countersKey);
  }

 
}
import 'package:flutter/material.dart';
import '../models/counter_model.dart';

class CounterCard extends StatelessWidget {
  final CounterModel counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;
  final VoidCallback onDelete;

  const CounterCard({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.refresh_rounded, color: Colors.blue[700]),
                  title: const Text('Reset Counter',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  onTap: () {
                    onReset();
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.grey[300], height: 1),
                ListTile(
                  leading: Icon(Icons.delete_outline_rounded, color: Colors.red[700]),
                  title: const Text('Delete Counter',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  onTap: () {
                    onDelete();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
      child: Card(
        color: Color(counter.colorValue),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(counter.colorValue),
                Color(counter.colorValue).withOpacity(0.9),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    counter.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove_circle_outlined,
                        color: Colors.white.withOpacity(0.9),
                        size: 32,
                      ),
                      onPressed: onDecrement,
                      splashRadius: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${counter.value}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: 'RobotoMono',
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: onIncrement,
                      splashRadius: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';
import '../widgets/counter_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CounterController _counterController;

  @override
  void initState() {
    super.initState();
    _counterController = CounterController();
    _counterController.addListener(_onCounterChanged);
  }

  @override
  void dispose() {
    _counterController.removeListener(_onCounterChanged);
    _counterController.dispose();
    super.dispose();
  }

  void _onCounterChanged() {
    setState(() {});
  }

  void showAddCounterDialog() {
    final controller = TextEditingController();
    Color selectedColor = Colors.blue.shade400;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 32,
                spreadRadius: -8,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_circle_rounded,
                          color: Colors.blue.shade600,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'New Counter',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: controller,
                      autofocus: true,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Counter Name',
                        labelStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Color',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _colorOption(
                              Colors.blue.shade400,
                              'Blue',
                              selectedColor,
                              () {
                                selectedColor = Colors.blue.shade400;
                                setState(() {});
                              },
                            ),
                            _colorOption(
                              Colors.red.shade400,
                              'Red',
                              selectedColor,
                              () {
                                selectedColor = Colors.red.shade400;
                                setState(() {});
                              },
                            ),
                            _colorOption(
                              Colors.green.shade400,
                              'Green',
                              selectedColor,
                              () {
                                selectedColor = Colors.green.shade400;
                                setState(() {});
                              },
                            ),
                            _colorOption(
                              Colors.orange.shade400,
                              'Orange',
                              selectedColor,
                              () {
                                selectedColor = Colors.orange.shade400;
                                setState(() {});
                              },
                            ),
                            _colorOption(
                              Colors.purple.shade400,
                              'Purple',
                              selectedColor,
                              () {
                                selectedColor = Colors.purple.shade400;
                                setState(() {});
                              },
                            ),
                            _colorOption(
                              Colors.pink.shade400,
                              'Pink',
                              selectedColor,
                              () {
                                selectedColor = Colors.pink.shade400;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey.shade600,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.text.trim().isNotEmpty) {
                          _counterController.addCounter(
                            controller.text.trim(),
                            selectedColor.value,
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Create',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _colorOption(Color color, String label, Color selected, VoidCallback onTap) {
    final isSelected = color.value == selected.value;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                ],
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counters = _counterController.counters;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Count It',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.grey.shade800,
                letterSpacing: 0.8,
              ),
            ),
            centerTitle: false,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey.shade300,
            actions: [
              if (counters.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    '${counters.length} Counter${counters.length > 1 ? 's' : ''}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
            ],
          ),
          if (counters.isEmpty)
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.integration_instructions_outlined,
                    size: 120,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No counters yet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tap the + button to create your first counter',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: showAddCounterDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade600,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Create First Counter',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final counter = counters[index];
                  return CounterCard(
                    counter: counter,
                    onIncrement: () => _counterController.incrementCounter(index),
                    onDecrement: () => _counterController.decrementCounter(index),
                    onReset: () => _counterController.resetCounter(index),
                    onDelete: () => _counterController.deleteCounter(index),
                  );
                },
                childCount: counters.length,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddCounterDialog,
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        icon: const Icon(Icons.add_rounded, size: 24),
        label: const Text(
          'Add Counter',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
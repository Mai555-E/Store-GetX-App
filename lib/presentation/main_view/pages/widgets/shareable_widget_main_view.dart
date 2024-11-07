import 'package:flutter/material.dart';

class TypesChips extends StatefulWidget {
  final List<String> chips;
  static int selectedChipIndex = 0;
  const TypesChips({super.key, required this.chips});

  @override
  State<TypesChips> createState() => _TypesChipsState();
}

class _TypesChipsState extends State<TypesChips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(50),
        child: ListView.separated(
            itemCount: widget.chips.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) => ChoiceChip(
                label: Text(widget.chips[index]),
                selected: TypesChips.selectedChipIndex == index,
                onSelected: (selected) => setState(() => TypesChips.selectedChipIndex = index),
                labelStyle: TextStyle(color: TypesChips.selectedChipIndex == index ? Colors.white : Colors.black))),
      ),
    );
  }
}

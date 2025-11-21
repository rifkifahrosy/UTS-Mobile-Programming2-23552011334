import 'package:flutter/material.dart';

class SkillItem extends StatefulWidget {
  final String skill;

  const SkillItem({super.key, required this.skill});

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  bool active = false;  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => active = !active),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: active ? Colors.blue : Colors.blue.shade100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: Colors.blue.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          widget.skill,
          style: TextStyle(
            color: active ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

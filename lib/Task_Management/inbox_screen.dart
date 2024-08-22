// inbox_screen.dart
import 'package:flutter/material.dart';
import 'package:karma/Task_Management/horizontal_card_list.dart';
import 'package:karma/Task_Management/task_overlay.dart';
import 'package:karma/Task_Management/vertical_card_list.dart';
import 'package:karma/Task_Management/models.dart';

class InboxScreen extends StatefulWidget {
  final List<String> cardTitles;
  final int selectedCardIndex;
  final Function(int) onCardTap;
  final void Function() onEditPressed; // Update this line

  InboxScreen({
    required this.cardTitles,
    required this.selectedCardIndex,
    required this.onCardTap,
    required this.onEditPressed,
  });

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Liam!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontFamily: 'GlacialIndifference'),
          ),
          SizedBox(height: 8),
          Text(
            'Below is a summary of all actions that need attention today!',
            style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'GlacialIndifference'),
          ),
          SizedBox(height: 16),
          ScrollableCardList(
            selectedCardIndex: widget.selectedCardIndex,
            cardTitles: widget.cardTitles,
            onCardTap: widget.onCardTap,
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              color: Colors.white,
              child: VerticalCardList(
                selectedCardIndex: widget.selectedCardIndex,
                onEditPressed: widget.onEditPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
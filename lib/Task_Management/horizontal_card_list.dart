import 'package:flutter/material.dart';

class ScrollableCardList extends StatelessWidget {
  final int selectedCardIndex;
  final List<String> cardTitles;
  final Function(int) onCardTap;

  ScrollableCardList({
    required this.selectedCardIndex,
    required this.cardTitles,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cardTitles.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedCardIndex == index;
                return GestureDetector(
                  onTap: () => onCardTap(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0.5),
                    child: Card(
                      color: isSelected ? Colors.blue : Colors.grey[300],
                      elevation: isSelected ? 4 : 0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Center(
                          child: Text(
                            cardTitles[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontFamily: 'GlacialIndifference',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 4),
          _buildIconButton(context, 'assets/icons/Filter.png'),
          SizedBox(width: 8),
          _buildIconButton(context, 'assets/icons/Sort.png'),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String assetPath) {
    return Container(
      width: 45,
      height: 43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Image.asset(assetPath),
        onPressed: () {
          // Handle filter/sort action
        },
      ),
    );
  }
}

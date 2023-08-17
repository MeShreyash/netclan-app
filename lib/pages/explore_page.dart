import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../widget/info_card.dart';

class ExplorePage extends ConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedTabIndex = ref.watch(selectedBottomTabIndexProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SegmentedControl(),
        _buildSearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: cards.map((card) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: InfoCard(
                    card.name,
                    card.location,
                    card.occupation,
                    card.radius,
                    card.purposeList,
                    card.status,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sort),
          ),
        ],
      ),
    );
  }
}

class SegmentedControl extends StatelessWidget {
  final List<String> labels = ['Personal', 'Business', 'Merchant'];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final selectedIndex = ref.watch(selectedSectionIndexProvider);

      return Container(
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(labels.length, (index) {
            return _buildSectionButton(context, index, selectedIndex, ref);
          }),
        ),
      );
    });
  }

  Widget _buildSectionButton(
      BuildContext context, int index, int selectedIndex, WidgetRef ref) {
    bool isSelected = index == selectedIndex;

    return Expanded(
      child: InkWell(
        onTap: () =>
            ref.read(selectedSectionIndexProvider.notifier).state = index,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            labels[index],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}

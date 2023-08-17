import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netclan_app/main.dart';

final List<String> purposeList = [
  'Coffee',
  'Business',
  'Hobbies',
  'Friendship',
  'Movies',
  'Dinner',
  'Dating',
  'Matrimony',
];

final textFieldControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final characterCountProvider = Provider<int>((ref) {
  final controller = ref.watch(textFieldControllerProvider);
  return controller.text.length;
});

class RefinePage extends ConsumerStatefulWidget {
  RefinePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RefinePageState();
}

class _RefinePageState extends ConsumerState<RefinePage> {
  double _value = 0;
  String selectedValue = 'Available | Hey Let Us Connect';

  @override
  Widget build(BuildContext context) {
    final category = ref.read(selectedCategoryProvider);

    final statusController = ref.watch(textFieldControllerProvider);
    final characterCount = ref.watch(characterCountProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Refine'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your Availability',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.only(left: 3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: DropdownButton<String>(
                  elevation: 0,
                  value: selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Available | Hey Let Us Connect',
                    'Away | Stay Discrete And Watch',
                    'Busy | Do Not Disturb | Will Catch Up Later',
                    'SOS | Emergency! Need Assistance! HELP!',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: 20),
              Text(
                'Add Your Status',
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: statusController,
                    // onChanged: (value) {
                    //   ref.watch(textFieldControllerProvider).text = value;
                    // },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    minLines: 1,
                    maxLines: null,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Text('$characterCount/250'),
              ),

              SizedBox(height: 20),
              Text(
                'Select Hyper local Distance',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 40),
              //SLIDER
              Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1.0,
                      trackShape: RoundedRectSliderTrackShape(),
                      activeTrackColor: appBarColor,
                      inactiveTrackColor: secondaryColor,
                      thumbColor: appBarColor,
                      activeTickMarkColor: appBarColor,
                      inactiveTickMarkColor: Colors.white,
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: appBarColor,
                      valueIndicatorTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 100,
                      value: _value,
                      label: '${_value.round()}',
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1 km',
                          style: TextStyle(color: primaryColor),
                        ),
                        Text(
                          '100 km',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Text(
                'Select Purpose',
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              SizedBox(height: 10),
              //CHIPS
              Wrap(
                spacing: 10.0,
                children: purposeList.map((element) {
                  bool isSelected = category.contains(element);

                  return ChoiceChip(
                    label: Text(
                      element,
                      style: TextStyle(fontSize: 15),
                    ),
                    selected: isSelected,
                    backgroundColor: Colors.white,
                    selectedColor: primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    selectedShadowColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: primaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(
                          30.0), // Adjust the border radius as needed
                    ),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          category.add(element);
                        } else {
                          category.remove(element);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 30),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Save & Explore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

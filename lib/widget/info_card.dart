import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netclan_app/main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InfoCard extends ConsumerWidget {
  final String name;
  final String location;
  final String occupation;
  final int radius;
  final List purposeList;
  final String status;
  InfoCard(
    this.name,
    this.location,
    this.occupation,
    this.radius,
    this.purposeList,
    this.status, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 10),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 10, bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 155),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      '+ INVITE',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                location + ' | ' + occupation,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Within $radius m',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 240,
                                animation: true,
                                lineHeight: 14.0,
                                percent: radius / 1000,
                                barRadius: Radius.circular(30),
                                progressColor: Colors.blueGrey,
                              ),
                              SizedBox(height: 18),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        purposeList.join(' | '),
                        style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 100,
                  width: 85,
                  decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Align(
                    child: Text(
                      'AB',
                      style: TextStyle(
                        color: appBarColor,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

final List<InfoCard> cards = [
  InfoCard(
    'Armaan Malik',
    'New Delhi',
    'Business ',
    60,
    ['Coffee', 'Business'],
    'Ready for a party.',
  ),
  InfoCard(
    'Armaan Malik',
    'New Delhi',
    'Business ',
    450,
    ['Dating', 'Dinner', 'Matrimony'],
    'Ready for a party.',
  ),
  InfoCard(
    'Armaan Malik',
    'New Delhi',
    'Business ',
    100,
    ['Friendship', 'Movies'],
    'Ready for a party.',
  )
];

class CustomCard {
  final String name;
  final String location;
  final String occupation;
  final int radius;
  final List purposeList;
  final String status;

  CustomCard(
    this.name,
    this.location,
    this.occupation,
    this.radius,
    this.purposeList,
    this.status,
  );
}

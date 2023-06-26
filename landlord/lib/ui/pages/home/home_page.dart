import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:landlord/models/place.dart';
import 'package:landlord/models/test.dart';
import 'package:landlord/ui/resource/colors.dart';
import 'package:landlord/ui/resource/images.dart';
import 'package:landlord/ui/resource/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildStatisticText(int number, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number.toString(),
          style: ResourceTextStyle.medium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: ResourceTextStyle.mediumOverline,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildPropertyTile(Color color, Place place) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(width: 2, color: color),
      ),
      child: Row(
        children: [
          Image.asset(
            ResoureImage.img_house_1,
            width: 100,
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                place.title,
                style: ResourceTextStyle.bold.copyWith(
                  color: ResourceTextStyle.COLOR.withOpacity(0.9),
                ),
              ),
              Text('Tenant:  ${place.tenant}'),
              Text(
                'payment:  ${DateFormat('dd MMMM').format(place.date)}',
                style: ResourceTextStyle.normal.copyWith(color: ResourceTextStyle.COLOR.withOpacity(0.8)),
              ),
            ],
          ),
          Spacer(),
          Text(
            '${Random().nextInt(900) + 100} \$',
            style: ResourceTextStyle.mediumOverline.copyWith(color: color),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> property = [
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
      ResoureColors.primary_1.withOpacity(0.9),
    ];

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ResourceTextStyle.PRIMARY_1,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: height * 0.25,
            padding: const EdgeInsets.only(top: 40),
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Icon(Icons.search_outlined),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.notifications_none_outlined,
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildStatisticText(PlaceList.cache.length, 'amout'),
                    buildStatisticText(0, 'complited'),
                    buildStatisticText(0, 'coming'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Container(
              height: height * 0.68,
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Accomodations', style: ResourceTextStyle.mediumOverline),
                        Text('Open All'),
                      ],
                    ),
                  ),
                  ...List.generate(
                      PlaceList.cache.length, (index) => buildPropertyTile(property[index], PlaceList.cache[index])),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

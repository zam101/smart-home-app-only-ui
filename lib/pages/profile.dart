import 'package:flutter/material.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<bool> devicesStatus = [true, false, true, false, true];

  Widget device(
      IconData icon, String name, int value, int index, List<String> rooms) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 0,
        child: Container(
            //constraints: BoxConstraints(maxHeight: 150,minHeight:98),
            width: double.infinity,
            //height:150,
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                height: 70,
                                width: 58,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Icon(
                                  icon,
                                  color: secondaryColor,
                                  size: 30,
                                ))),
                            const SizedBox(width: 12),
                            Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                        color: primaryTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text("$value Devices",
                                      style: const TextStyle(
                                          color: secondaryTextColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400))
                                ])
                          ],
                        ),
                        Switch(
                            splashRadius: 0,
                            inactiveTrackColor: const Color(0xFFD1D1D1),
                            activeColor: secondaryColor,
                            activeTrackColor: activeColor,
                            inactiveThumbColor: secondaryBgColor,
                            trackOutlineColor:
                                WidgetStateProperty.resolveWith<Color?>(
                                    (Set<WidgetState> states) =>
                                        states.contains(WidgetState.selected)
                                            ? activeColor
                                            : secondaryBgColor),
                            value: devicesStatus[index],
                            onChanged: (bool newValue) {
                              setState(() {
                                devicesStatus[index] = newValue;
                              });
                            }),
                      ]),
                  rooms.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: SizedBox(
                            height: 36,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: List.generate(rooms.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: secondaryBgColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          rooms[index],
                                          style: const TextStyle(
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ))),
                                );
                              }),
                            ),
                          ),
                        )
                      : const SizedBox(height: 0)
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 28),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            color: secondaryBgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.arrow_back))),
                InkWell(
                    child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            color: secondaryBgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.more_vert))),
              ]),
          const SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                device(Icons.cleaning_services, "Vacuum", 1, 0, []),
                device(Icons.hvac, "Air Conditioning", 3, 1,
                    ["Living room", "Bedroom", "Kitchen"]),
                device(Icons.lightbulb, "Lightings", 2, 2,
                    ["Living room", "Kitchen"]),
                device(Icons.key, "Door Locks", 1, 3, []),
                device(Icons.grass, "Automatic irrigation", 3, 4,
                    ["Living room", "Kitchen", "Balcony"]),
              ])))
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:smarthome/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  List<bool> devicesStatus = [false, true, true, false, false, false];
  Widget tab(IconData icon, String name, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ConstrainedBox(
          //width:69,
          //height:78,
          constraints: const BoxConstraints(
              minWidth: 69, maxWidth: 90, minHeight: 78, maxHeight: 78),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        tabIndex = index;
                      });
                    },
                    child: Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tabIndex == index
                                ? primaryColor
                                : secondaryColor),
                        child: Icon(icon,
                            color: tabIndex == index
                                ? secondaryColor
                                : secondaryTextColor,
                            size: 28))),
                Text(name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: tabIndex == index
                            ? primaryColor
                            : secondaryTextColor))
              ])),
    );
  }

  Widget device(IconData icon, String name, String value, int index) {
    return Card(
      elevation: 0,
      //shadowColor: primaryColor,
      child: Container(
        height: 168,
        decoration: BoxDecoration(
          color: devicesStatus[index] == true ? primaryColor : secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(icon,
                    size: 28,
                    color: devicesStatus[index] == true
                        ? secondaryColor
                        : secondaryTextColor),
                //SizedBox(height:14),
                const Spacer(),
                Text(name,
                    style: TextStyle(
                        fontSize: 14,
                        color: devicesStatus[index] == true
                            ? secondaryColor
                            : primaryTextColor,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 7),
                Text(value,
                    style: TextStyle(
                        fontSize: 14,
                        color: devicesStatus[index] == true
                            ? secondaryColor
                            : secondaryTextColor,
                        fontWeight: FontWeight.w400)),
                //SizedBox(height:14),
                //Spacer(),
                Switch(
                    splashRadius: 0,
                    inactiveTrackColor: const Color(0xFFD1D1D1),
                    activeColor: secondaryColor,
                    activeTrackColor: activeColor,
                    inactiveThumbColor: secondaryBgColor,
                    trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
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
        ),
      ),
    );
  }

  Widget room() {
    return Column(children: [
      const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("All Devices",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryTextColor)),
            Icon(Icons.add, size: 24)
          ]),
      const SizedBox(height: 20),
      Expanded(
        child: SingleChildScrollView(
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ((MediaQuery.of(context).size.width - 28) ~/ 185).toInt(),
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            primary: false,
            children: <Widget>[
              device(Icons.lightbulb_outlined, "Lightings", "Ornar aliquan", 0),
              device(Icons.grass_outlined, "Automatic irrigation",
                  "Lacus scelerique", 1),
              device(Icons.curtains_closed_outlined, "Automatic curtains",
                  "Proin aliquet", 2),
              device(Icons.speaker_outlined, "Speakers", "integer gravida", 3),
              device(Icons.cleaning_services, "Vacuum", "Cursus feugiat", 4),
              device(Icons.hvac, "Air Conditioning", "18°", 5),
            ],
          ),
        ),
      ),
      const SizedBox(height: 14)
    ]);
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
                            child: const Icon(Icons.menu))),
                    InkWell(
                        child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                                color: secondaryBgColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.notifications_outlined))),
                  ]),
              const SizedBox(height: 20),
              const Text("16 July 2021",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  )),
              const SizedBox(height: 20),
              Container(
                height: 80,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  tab(Icons.bedroom_parent, "Bedroom", 0),
                  tab(Icons.bathtub, "Bathroom", 1),
                  tab(Icons.chair, "Living room", 2),
                  tab(Icons.kitchen, "Kitchen", 3),
                  tab(Icons.directions_car, "Garage", 4)
                ]),
              ),
              const SizedBox(height: 25),
              Expanded(child: room())
            ]),
      ),
    );
  }
}

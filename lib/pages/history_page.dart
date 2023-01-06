import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../constants.dart';

class HistoryPage extends StatefulWidget{
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int tabIndex = 0;
  double tempValue = 18;
  bool airCond = true;
  
  Widget tab(String tabName, int index){
    return Padding(
      padding: const EdgeInsets.only(right:16.0),
      child: InkWell(
        onTap:(){
          setState(() {
            tabIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              tabName,
              style:TextStyle(
                color:tabIndex==index ? primaryColor : secondaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 14
              )
            ),
            tabIndex == index ?
            const Padding(
              padding: EdgeInsets.symmetric(vertical:6.0),
              child: Icon(Icons.fiber_manual_record,color: primaryColor,size:14),
            )
            :const SizedBox(height:0)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const SizedBox(
              height:28
            ),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  InkWell(
                    child:Container(
                      width:38,
                      height:38,
                      decoration: BoxDecoration(
                        color:secondaryBgColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Icon(Icons.arrow_back)
                    )
                  ),
                  const Text("Air Conditioning",style:TextStyle(color:primaryTextColor,fontSize: 16,fontWeight: FontWeight.bold)),
                  InkWell(
                    child:Container(
                      width:38,
                      height:38,
                      decoration: BoxDecoration(
                        color:secondaryBgColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Icon(Icons.upload_file)
                    )
                  ),
                  
                ]
              ),
            const SizedBox(
              height:20
            ),
            Container(
              height:45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:[
                  tab("Bedroom",0),
                  tab("Living Room",1),
                  tab("Childrens Room",2),
                  tab("Bathroom",3),

                ]
              ),
            ),
            const SizedBox(
              height:20
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height:300,
                            width: 300,
                            decoration:BoxDecoration(
                              color:const Color(0xFFeef0fe),
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(color:const Color(0xFFF3F3F3),width: 20)
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Text("${tempValue.round()}°",style: const TextStyle(color:primaryTextColor,fontSize:22,fontWeight:FontWeight.bold),),
                                const SizedBox(height:8),
                                const Text("Temperature",style:TextStyle(color:secondaryTextColor,fontSize: 14,fontWeight: FontWeight.w500))
                              ]
                            )
                          ),
                          SleekCircularSlider(
                            innerWidget: (double value){
                              return const SizedBox(height:0);
                            },
                            min:0,
                            max:50,
                            initialValue: tempValue,
                            onChange: (double value) {
                              setState(() {
                                tempValue = value;
                              });
                            },
                            appearance: CircularSliderAppearance(
                              startAngle: 270,
                              angleRange: 360,
                              size:300,
                              customWidths: CustomSliderWidths(
                                progressBarWidth: 4,
                                trackWidth: 2,
                                handlerSize: 12
                              ),
                              customColors: CustomSliderColors(
                                trackColor: const Color(0xFFE0E0E0),
                                progressBarColor: primaryColor,
                                dotColor: primaryColor

                              )
                            ),
                          )
                        ]
                      ),
                    ),
                const SizedBox(
                  height:20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const [
                        Text("Air Conditioning",style: TextStyle(color:primaryTextColor,fontSize: 14,fontWeight: FontWeight.w500),),
                        SizedBox(height:4),
                        Text("Cras elit nibh",style: TextStyle(color:secondaryTextColor,fontSize: 14,fontWeight: FontWeight.w400),)
                      ]
                    ),
                    Switch(
                      splashRadius: 0,
                      inactiveTrackColor: const Color(0xFFD1D1D1),
                      activeColor:activeColor,
                      value:airCond,
                      onChanged:(bool newValue){
                        setState(() {
                          airCond = newValue;
                        });
                      }
                    ),

                  ]
                ),
                const SizedBox(
                  height:20
                ),
                const Text(
                  "Morbi sed risus magna. Donec blandit, erat air and pharetra tincidunt convallis, neque nisi molestie o metus, quis tincidunt massa urna ut ex. Donec two justo dolor, molestie ut aliquam cursus, sodales an lacinia mi. Sed quis magna ut est accum bedroom.",
                  style:TextStyle(
                    color:secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                    )
                  ),
                const SizedBox(height:20),
                Container(
                  height:48,
                  width:double.infinity,
                  child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      elevation: 3,
                      primary:primaryColor,
                      minimumSize: const Size(160,48),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                    ),
                    child:const Text("Save Temperature",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 14 )),
                    onPressed: (){},
                    ),
                ),
                const SizedBox(height:20)

                  ],
                ),
              ),
            ),
          ]
        ),
      ), 
    );
  }
}

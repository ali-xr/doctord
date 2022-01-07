import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctord/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';

class GoodDay extends StatefulWidget {
  const GoodDay({Key? key}) : super(key: key);

  @override
  _GoodDayState createState() => _GoodDayState();
}

class _GoodDayState extends State<GoodDay> {
  final DatePickerController _controller = DatePickerController();
  final List<String> entries = <String>[
    'Dr. Askarov Ravshan',
    'Dr. Elena Valeryevna',
    'Probiotic, 250mg',
    'Loratadine, 10mg'
  ];
  final List<String> work = <String>[
    'Radiologist, Akfa Medline',
    'Dentist, Smalto Dental Clinic',
    '10:30 AM  Completed',
    '05:00 PM  Pending'
  ];
  final List<String> worktime = <String>[
    '13:40 , November 25',
    '11:00 , November 27',
  ];
  final List<String> images = <String>[
    'assets/images/askarov.png',
    'assets/images/elena.png',
    'assets/images/tick.png',
    'assets/images/indicat.png'

  ];
  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/X8.png"),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: getProportionScreenWidth(12)),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: getProportionScreenHeight(87),
                          bottom: getProportionScreenHeight(17)),
                      child: Text(
                        "hello".tr,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontSize: getProportionScreenWidth(30),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.red,
                      onPressed: () {
                        Get.updateLocale(Get.locale == const Locale("uz", "UZ")
                            ? const Locale("en", "US")
                            : const Locale("uz", "UZ"));
                      },
                      icon: const Icon(
                        Icons.translate,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    // margin: const EdgeInsets.only(left: 35),
                    child: Text(
                      'come'.tr,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.white,
                        fontSize: getProportionScreenWidth(18),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: getProportionScreenHeight(9),
                  ),
                  height: getProportionScreenHeight(160),
                  width: getProportionScreenWidth(320),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromRGBO(234, 240, 241, 0.7),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(
                            left: getProportionScreenWidth(18),
                            top: getProportionScreenHeight(30)),
                        child: Text(
                          DateFormat.yMMMM().format(_selectedValue),
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.black45,
                            fontSize: getProportionScreenWidth(24),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DatePicker(
                                DateTime.now(),
                                width: getProportionScreenWidth(48),
                                height: getProportionScreenHeight(85),
                                controller: _controller,
                                initialSelectedDate: DateTime.now(),
                                selectionColor: const Color(0xFFDE8071),
                                selectedTextColor: Colors.white,
                                deactivatedColor: Colors.red,
                                inactiveDates: [
                                  DateTime.now().add(const Duration(days: 3)),
                                  DateTime.now().add(const Duration(days: 5))
                                ],
                                onDateChange: (date) {
                                  setState(() {
                                    _selectedValue = date;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1.8,
                  margin: EdgeInsets.symmetric(
                      vertical: getProportionScreenHeight(4.5)),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      if (index % 2 == 1) {
                        return Container(
                          margin:const EdgeInsets.only(top: 15),
                          child: Text(
                            "today".tr,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontSize: getProportionScreenWidth(18),
                            ),
                          ),
                        );
                      }
                      return const Divider(height: 15);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return index >= 2
                          ? Container(
                              height: getProportionScreenHeight(65),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20,right: 10),
                                    height: getProportionScreenHeight(45),
                                    width: getProportionScreenWidth(45),
                                    child: ImageIcon(
                                      AssetImage("${images[index]}"),
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${entries[index]}',
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize:
                                              getProportionScreenWidth(14),
                                          color: Colors.black.withOpacity(.6),
                                        ),
                                      ),
                                      // Container(
                                        // margin: EdgeInsets.only(
                                          // bottom: getProportionScreenHeight(16),
                                         Text(
                                          '${work[index]}',
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                           fontSize:
                                              getProportionScreenWidth(14),
                                            color: const Color(0xFF718288),
                                          ),
                                        ),
                                      // ),
                                      
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: getProportionScreenHeight(90),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: getProportionScreenWidth(22),
                                  top: getProportionScreenHeight(10),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${entries[index]}',
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize:
                                                getProportionScreenWidth(18),
                                            color: Colors.black.withOpacity(.6),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom:
                                                getProportionScreenHeight(14),
                                          ),
                                          child: Text(
                                            '${work[index]}',
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionScreenWidth(10),
                                              color: const Color(0xFF718288),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'worktime'.tr + ' ${worktime[index]}',
                                          style: TextStyle(
                                            fontSize:
                                                getProportionScreenWidth(12),
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFDE8071),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Positioned(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 20, bottom: 15),
                                            height:
                                                getProportionScreenHeight(58),
                                            width: getProportionScreenWidth(65),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${images[index]}"),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(37),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          width: 20,
                                          height: 20,
                                          // top: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF4894FF),
                                              borderRadius:
                                                  BorderRadius.circular(37),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                ),

                // Expanded(child: ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../Service/custom_text_button.dart';
import '../get_it.dart';
import '../widgets/counter_with_text.dart';
import '../widgets/custom_circle_button.dart';

class HomeApp2 extends StatefulWidget {
  const HomeApp2({Key? key}) : super(key: key);

  @override
  _HomeApp2State createState() => _HomeApp2State();
}

class _HomeApp2State extends State<HomeApp2> {
  double valueKm = 0;
  // List<UserModel>? restaurantList;

  @override
  void initState() {
    super.initState();
    // getAllRestaurant();
  }

  // getAllRestaurant() async {
  //   final getItInstance = getIt<IAuthService>();
  //   restaurantList = await getItInstance.getAllRestaurant();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      (size.width < 900)
                          ? Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.menu, color: Colors.white),
                          ),
                        ),
                      )
                          : Container(
                        width: 350,
                        child: const TextField(
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            hintText: "Enter your search request...",
                            prefixIcon: Padding(
                              padding:
                              EdgeInsets.fromLTRB(10, 5, 0, 0),
                              child: FaIcon(
                                FontAwesomeIcons.search,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      CustomCircleButton(
                        icon: FontAwesomeIcons.slidersH,
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      CustomTextButton(
                        onTap: () {},
                        text: "Go to Premium",
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Find the best place",
                            style: largestText,
                          ),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(text: "249 restaurants, "),
                                TextSpan(
                                  text: "choose yours",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      if (size.width > 590) const SpecialAndCategoriesCounter(),
                    ],
                  ),
                  if (size.width <= 590) ...[
                    const SizedBox(height: 30),
                    const SpecialAndCategoriesCounter(),
                  ],
                  const SizedBox(height: 40),
                  // CategoryIconWithText(),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "New restaurants",
                        style: largeText,
                      ),
                      const Spacer(),
                      Slider(
                        divisions: 10,
                        value: valueKm,
                        onChanged: (value) {
                          setState(() {
                            valueKm = value;
                          });
                        },
                        min: 0,
                        max: 10,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black,
                        label: "$valueKm Km",
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            // RestaurantList(
            //   restaurantList: restaurantList ?? cachedRestaurantList,
            // ),
          ],
        ),
      ),
    );
  }
}

class SpecialAndCategoriesCounter extends StatelessWidget {
  const SpecialAndCategoriesCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CounterWithText(number: 94, text: "Specials"),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: 1,
          height: 50,
          color: Colors.grey.shade300,
        ),
        const CounterWithText(number: 23, text: "Delivery"),
      ],
    );
  }
}

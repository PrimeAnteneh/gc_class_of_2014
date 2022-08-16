import 'package:flutter/material.dart';
import 'package:gc_class_of_2014/models/character.dart';
import 'package:gc_class_of_2014/widgets/custom_page_transition.dart';
import 'package:gc_class_of_2014/widgets/my_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEFEFEF),
            Color(0xFFD0DAE0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (context, b) => [
            SliverAppBar(
              elevation: 6.0,
              shadowColor: const Color(0xFFD0DAE0),
              forceElevated: true,
              backgroundColor: const Color(0xFFEFEFEF),
              title: Text(
                'DBU GC Class Of 2014',
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  fontFamily: 'Serif',
                  decoration: TextDecoration.underline,
                ),
              ),
              centerTitle: true,
            ),
          ],
          body: GridView.builder(
              itemCount: dp.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      FadePageTransition(
                        child: CustomSliderWidget(index: index),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    width: 100,
                    margin: const EdgeInsets.all(7),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFEFEFEF),
                          Color(0xFFD0DAE0),
                        ],
                      ),
                      //color: Colors.accents[index],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.accents[index + 2], width: 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: index < 6
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Colors.accents[index],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Pics/$index.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.accents[index + 2],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        '?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.07,
                                          color: Colors.blueGrey[800],
                                          fontFamily: 'Serif',
                                        ),
                                      ),
                                    ],
                                  )),
                        ),
                        SizedBox(
                          height: 45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /*  Hero(
                                transitionOnUserGestures: true,
                                tag: 'nav$index',
                                child: */
                              Text(
                                dp[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.042,
                                  color: Colors.blueGrey[800],
                                  fontFamily: 'Serif',
                                  decoration: TextDecoration.underline,
                                ),
                                // ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

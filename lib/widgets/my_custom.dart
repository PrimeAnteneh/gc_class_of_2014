import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gc_class_of_2014/models/character.dart';
import 'package:gc_class_of_2014/pages/desc_page.dart';
import 'package:gc_class_of_2014/widgets/custom_page_transition.dart';

class CustomSliderWidget extends StatefulWidget {
  final int? index;
  final int? randomInt;
  const CustomSliderWidget({Key? key, this.index, this.randomInt})
      : super(key: key);

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  int _current = 0;
  final dynamic _selectedIndex = {};

  final CarouselController _carouselController = CarouselController();
  /* v() async {
    final manifestJson =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    return manifestJson;
  } */
  /* void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      v();
    });
  } */

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
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: screenHeight * 0.05,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.blueGrey[600],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*   Hero(
                transitionOnUserGestures: true,
                tag: 'nav${widget.index}',
                child:  */
              Text(
                '${dp[widget.index!]} GC\nClass Of 2014',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.blueGrey[600],
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                //),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.7,
                  child: CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                        height: screenWidth * 1.1,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.70,
                        enlargeCenterPage: true,
                        pageSnapping: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    items: List<Widget>.generate(4, (index) {
                      return Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              FadePageTransition(
                                child: Descriptions_Page(
                                  imgURL: 'assets/images/Suits/$index.png',
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              /* Hero(
                                transitionOnUserGestures: true,
                                tag: 'nav${widget.index}',
                                child: */
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFEFEFEF),
                                      Color(0xFFD0DAE0),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color:
                                          Colors.accents[Random().nextInt(16)],
                                      width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 20,
                                        offset: Offset(0, 5))
                                  ],
                                ),
                              ),
                              // ),
                              SizedBox(
                                /* padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFEFEFEF),
                                        Color(0xFFD0DAE0),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.accents[Random().nextInt(16)],
                                        width: 1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 20,
                                          offset: Offset(0, 5))
                                    ]), */
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Hero(
                                          transitionOnUserGestures: true,
                                          tag: 'img$index',
                                          child: Container(
                                            height: screenWidth * 0.9,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Image.asset(
                                                'assets/images/Suits/$index.png',
                                                fit: BoxFit.scaleDown),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: Hero(
                                            transitionOnUserGestures: true,
                                            tag: 'n$index',
                                            child: const Material(
                                              type: MaterialType.transparency,
                                              child: Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Hero(
                                            transitionOnUserGestures: true,
                                            tag: 'lw$index',
                                            child: Material(
                                              type: MaterialType.transparency,
                                              child: Text(
                                                'Last Word',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

                    /* characters.map((movie) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_selectedIndex == movie) {
                                    _selectedIndex = {};
                                  } else {
                                    _selectedIndex = movie;
                                  }
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: const [
                                        Color(0xFF9A8478),
                                        Color(0xFF1E130C),
                                      ],
                                    ), //color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: _selectedIndex == movie
                                        ? Border.all(
                                            color: Colors.blue.shade500, width: 3)
                                        : null,
                                    boxShadow: _selectedIndex == movie
                                        ? [
                                            BoxShadow(
                                                color: Colors.blue.shade100,
                                                blurRadius: 30,
                                                offset: Offset(0, 10))
                                          ]
                                        : [
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(0.2),
                                                blurRadius: 20,
                                                offset: Offset(0, 5))
                                          ]),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 320,
                                        margin: EdgeInsets.only(top: 10),
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Image.asset('${movie.imagePath}',
                                            fit: BoxFit.cover),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        movie.name,
                                        style: TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        movie.description,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList() */
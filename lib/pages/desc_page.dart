import 'dart:ui';

import 'package:flutter/material.dart';

class Descriptions_Page extends StatefulWidget {
  final int? index;
  final String? imgURL;
  const Descriptions_Page({Key? key, this.index, this.imgURL})
      : super(key: key);

  @override
  State<Descriptions_Page> createState() => _Descriptions_PageState();
}

class _Descriptions_PageState extends State<Descriptions_Page> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEFEFEF),
            Color(0xFFD0DAE0),
            /*   Color(0xFF9A8478),
            Color(0xFF1E130C), */
          ],
        ),
        image: DecorationImage(
          image: AssetImage('${widget.imgURL}'),
          fit: BoxFit.contain,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(
                color: Colors.blueGrey[600],
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: screenWidth * 1.5,
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: 'img${widget.index}',
                    child:
                        Image.asset('${widget.imgURL}', fit: BoxFit.scaleDown),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              transitionOnUserGestures: true,
                              tag: 'n${widget.index}',
                              child: const Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Hero(
                              transitionOnUserGestures: true,
                              tag: 'lw${widget.index}',
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  'Last Word',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class HomePageButtons extends StatelessWidget {
  final String text;
  VoidCallback pressCallback;

  HomePageButtons({
    Key? key,
    required this.text,
    required this.pressCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
          height: 35,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  text,
                  style: const TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 0.5,
                          offset: Offset(0.4, 0.4),
                          color: Colors.black,
                        )
                      ],
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
              GestureDetector(
                onTap: pressCallback,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tümünü Gör',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

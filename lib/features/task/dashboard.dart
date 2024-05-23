import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_firebase/core/assets.dart';
import 'package:test_firebase/core/utils/icons.dart';
import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/src/sizedbox.dart';
import 'package:test_firebase/src/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        title: Text(
          "To-Do List",
          style: bodyXLarge.copyWith(fontSize: 10),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 40,
              width: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assets.profile,
                  fit: BoxFit.contain,
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Palette.greyText),
            ),
          )
        ],
        elevation: 1,
        backgroundColor: Color(0xFFFFFFFF),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Palette.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 55),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "65",
                          style: bodyXLarge.copyWith(
                              color: Palette.white, fontSize: 33),
                        ),
                        Text(
                          "Total Number Of Task",
                          style: bodyXLarge.copyWith(
                              color: Palette.white, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 12, top: 22),
                      // ignore: deprecated_member_use
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            taskLogo,
                            height: 70,
                            width: 40,
                            // ignore: deprecated_member_use
                            color: Color(0xFFe3edef),
                          ),
                        ],
                      )),
                ],
              ),
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black], // black to dim black
                ),
              ),
            ),
            kHight(5),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create New Task",
                    style:
                        bodyXLarge.copyWith(color: Palette.white, fontSize: 14),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Palette.white,
                      ))
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Palette.blue),
            ),
            kHight(30),
            Row(
              children: [
                Text(
                  "Task List",
                  style: bodyXLarge.copyWith(
                    color: Palette.black,
                  ),
                ),
                Text(
                  " (Total 4)",
                  style: bodyXLarge.copyWith(
                      color: Palette.black, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

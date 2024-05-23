import 'package:flutter/material.dart';
import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/src/sizedbox.dart';
import 'package:test_firebase/src/theme.dart';

class Taskcard extends StatelessWidget {
  final String? taskName;
  final String? fromdate;
  final String? toDate;
  final String? status;
  final Function onTap;
  final Function onLongPres;

  const Taskcard(
      {super.key,
      required this.onLongPres,
      required this.onTap,
      this.taskName,
      this.fromdate,
      this.toDate,
      this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        onLongPres();
      },
      onTap: () {
        onTap();
      },
      child: Card(
          color: Palette.white,
          elevation: 3,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "$taskName",
                    style: bodyXLarge.copyWith(fontSize: 15),
                  ),
                ),
                kHight(22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 12,
                          color: Palette.black,
                        ),
                        kWidth(8),
                        Text(
                          "$fromdate",
                          style: bodyXLarge.copyWith(
                              fontSize: 12, color: Palette.greyText),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          size: 12,
                          color: Palette.black,
                        ),
                        kWidth(8),
                        Text(
                          "$toDate",
                          style: bodyXLarge.copyWith(
                              fontSize: 12, color: Palette.greyText),
                        )
                      ],
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "$status",
                          style: TextStyle(color: Palette.white),
                        ),
                      ),
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Palette.black,
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                )
              ],
            ),
            height: 100,
            decoration: BoxDecoration(
                color: Palette.white, borderRadius: BorderRadius.circular(12)),
          )),
    );
  }
}

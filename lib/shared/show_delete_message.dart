// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';


import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/src/theme.dart';

// showLoaderDialog(BuildContext context, {bool isRootNav = false}) {
//   showDialog(
//       context: context,
//       useRootNavigator: isRootNav,
//       barrierDismissible: false,
//       builder: (context) => Center(child: CircularProgressIndicator()));
// }
showDeleteMessage(BuildContext context,
    {String? title,
    @required String? message,
    VoidCallback? onCompleted,
    bool useRootNavigator = false,
    bool showCancelButton = false,
    String? button1,
    String? button2,
    bool? isLogout,
    VoidCallback? onCancelled}) {
  showDialog(
    context: context,
    useRootNavigator: useRootNavigator,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      contentPadding:
          EdgeInsets.all(12), // Remove padding to control content layout
      content: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with delete icon and close button
            isLogout != true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            if (onCompleted != null) {
                              onCompleted();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: Color(0xFFFEF3F2),
                                shape: BoxShape.circle),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFFEE4E2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))),
                          )),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Palette.blue,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          if (onCancelled != null) {
                            onCancelled();
                          }
                        },
                      ),
                    ],
                  )
                : Container(),
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title ?? "Delete the product !", style: bodyXLarge),
            ),
            // Message
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "$message This action cannot be undone.",
                style: bodyMedium4.copyWith(color: Color(0xFF475467)),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);

                      if (onCancelled != null) {
                        onCancelled();
                      }
                    },
                    child: Container(
                      height: 44,
                      width: 170,
                      child: Center(
                        child: Text(
                          button2 ?? "Cancel",
                          style: TextStyle(color: Palette.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFD0D5DD)),
                        color: Palette.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);

                      if (onCompleted != null) {
                        onCompleted();
                      }
                    },
                    child: Container(
                      height: 44,
                      width: 170,
                      child: Center(
                        child: Text(
                          button1 ?? "Delete",
                          style: TextStyle(color: Palette.background),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: isLogout != true ? Colors.red : Palette.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

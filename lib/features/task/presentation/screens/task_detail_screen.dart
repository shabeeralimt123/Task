import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_firebase/core/assets.dart';
import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/src/sizedbox.dart';

class TaskdetailsScreen extends StatefulWidget {
  final Task tasks;
  const TaskdetailsScreen({super.key, required this.tasks});

  @override
  State<TaskdetailsScreen> createState() => _TaskdetailsScreenState();
}

class _TaskdetailsScreenState extends State<TaskdetailsScreen> {
  String formatDate(String dateString) {
    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String taskFromDate = formatDate(widget.tasks.taskFromDate.toString());
    String taskToDate = formatDate(widget.tasks.tasToDate.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.white,
        elevation: 1,
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
        title: Text(
          "Task Name",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Palette.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu,
                  color: Palette.greyText,
                ),
                kWidth(12),
                Text(
                  "Task Name",
                  style: TextStyle(
                      color: Palette.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            kHight(8),
            Text(
              widget.tasks != null ? widget.tasks.name : "",
              style: TextStyle(
                  color: Palette.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            kHight(12),
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Palette.greyText,
                ),
                kWidth(12),
                Text(
                  "Description",
                  style: TextStyle(
                      color: Palette.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            kHight(8),
            Text(
              widget.tasks != null ? widget.tasks.description! : "",
              style: TextStyle(
                  color: Palette.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            kHight(12),
            Row(
              children: [
                Icon(
                  Icons.flag_outlined,
                  color: Palette.greyText,
                ),
                kWidth(12),
                Text(
                  widget.tasks != null
                      ? "${getTaskPriorityString(widget.tasks.priority)} Priority"
                      : "",
                  style: TextStyle(
                      color: Palette.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
            kHight(12),
            Row(
              children: [
                Icon(Icons.calendar_month_outlined),
                kWidth(8),
                Text(
                  "From Date",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Palette.black),
                ),
                kWidth(8),
                Text(
                  "$taskFromDate at ${widget.tasks.taskFromTime}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Palette.black),
                ),
              ],
            ),
            kHight(12),
            Row(
              children: [
                Icon(Icons.calendar_month_outlined),
                kWidth(8),
                Text(
                  "To Date",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Palette.black),
                ),
                kWidth(25),
                Text(
                  "$taskToDate at ${widget.tasks.tasToTime}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Palette.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String getTaskPriorityString(TaskPriority? priority) {
    switch (priority) {
      case TaskPriority.high:
        return 'high';
      case TaskPriority.medium:
        return 'medium';
      case TaskPriority.low:
        return 'low';
      default:
        return ''; // Handle null or other cases if needed
    }
  }
}

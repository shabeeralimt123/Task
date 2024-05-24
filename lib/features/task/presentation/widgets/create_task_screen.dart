import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/core/utils/validator.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/features/task/presentation/notifier/task_notifier.dart';
import 'package:test_firebase/features/task/presentation/widgets/priority_container.dart';
import 'package:test_firebase/shared/app_text_filed.dart';
import 'package:test_firebase/shared/custom_button.dart';
import 'package:test_firebase/src/sizedbox.dart';
import 'package:test_firebase/src/theme.dart';

class AddTaskDialogueBox extends ConsumerStatefulWidget {
  const AddTaskDialogueBox({super.key});

  @override
  ConsumerState<AddTaskDialogueBox> createState() => _AddTaskDialogueBoxState();
}

class _AddTaskDialogueBoxState extends ConsumerState<AddTaskDialogueBox> {
  late TextEditingController taskNameController, descriptionController, emailId;
  bool isLoading = false;
  DateTime? selectedDate;
  DateTime? selectedToDate;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  bool validate = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedToDate = pickedDate;
      });
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    taskNameController = TextEditingController();
    descriptionController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Palette.white, borderRadius: BorderRadius.circular(12)),
      height: 600,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Create New Task",
                  style: bodyXlargeS,
                ),
              ),

              kHight(20),
              AppTextField(
                validator: (value) {
                  return Validator.validateField(
                      value, "task name is requires");
                },
                labelStyle: bodyLarge2.copyWith(fontWeight: FontWeight.w400),
                label: "Task Name",
                hintText: "Enter Task Name is Mandatory",
                color: Colors.black38,
                controller: taskNameController,
              ),
              kHight(12),
              AppTextField(
                validator: (value) {
                  return Validator.validateField(
                      value, "task description is requires");
                },
                hintText: "Enter Task Description is Mandatory",
                labelStyle: bodyLarge2.copyWith(fontWeight: FontWeight.w400),
                label: "Descriptions",
                color: Colors.black38,
                controller: descriptionController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Max 250 Letters",
                    style: TextStyle(color: Palette.greyText),
                  )
                ],
              ),
              kHight(12),
              Text(
                "Priority",
                style: TextStyle(
                    color: Palette.black, fontWeight: FontWeight.w700),
              ),

              kHight(12),
              Container(
                child: Row(
                  children: [
                    PriorityStatusContainer(
                      text: "high",
                      status: TaskPriority.high,
                    ),
                    PriorityStatusContainer(
                      text: "medium",
                      status: TaskPriority.medium,
                    ),
                    PriorityStatusContainer(
                      text: "low",
                      status: TaskPriority.low,
                    ),
                  ],
                ),
              ),
              kHight(12),
              Text(
                "Task date",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              kHight(12),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 22, right: 22),
                  decoration: BoxDecoration(
                      color: Palette.scaffoldBackground,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDate != null
                            ? '${selectedDate!.day},${_getMonthName(selectedDate!.month)} ${selectedDate!.year}'
                            : 'From Date',
                      ),
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Palette.blue,
                      )
                    ],
                  ),
                ),
              ),
              kHight(12),
              InkWell(
                onTap: () {
                  _selectToDate(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 22, right: 22),
                  decoration: BoxDecoration(
                      color: Palette.scaffoldBackground,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedToDate != null
                            ? '${selectedToDate!.day},${_getMonthName(selectedToDate!.month)} ${selectedToDate!.year}'
                            : 'To Date',
                      ),
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Palette.blue,
                      )
                    ],
                  ),
                ),
              ),
              kHight(12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _selectTime(context, startTimeController);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 22, right: 22),
                        decoration: BoxDecoration(
                          color: Palette.scaffoldBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              startTimeController.text.isNotEmpty
                                  ? startTimeController.text
                                  : 'Select Start Time',
                              style: TextStyle(color: Palette.black),
                            ),
                            Icon(
                              Icons.access_time_outlined,
                              color: Palette.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _selectTime(context, endTimeController);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 22, right: 22),
                        decoration: BoxDecoration(
                          color: Palette.scaffoldBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              endTimeController.text.isNotEmpty
                                  ? endTimeController.text
                                  : 'Select End Time',
                              style: TextStyle(color: Palette.black),
                            ),
                            Icon(
                              Icons.access_time_outlined,
                              color: Palette.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              kHight(12),
              Text(
                "Date And Time Field Is Mandatory",
                style: TextStyle(
                    color: validate == true ? Colors.red : Palette.black),
              ),
              kHight(25),
              CustomButton(
                  isLoading: isLoading,
                  color: Palette.blue,
                  onPress: () async {
                    final form = formKey.currentState;
                    if (form!.validate()) {
                      if (selectedDate == null ||
                          selectedToDate == null ||
                          startTimeController.text.isEmpty ||
                          endTimeController.text.isEmpty) {
                        setState(() {
                          validate = true;
                        });
                        return; // Exit function if any mandatory field is empty
                      }
                      try {
                        setState(() {
                          isLoading = true;
                        });
                        await ref
                            .read(taskNotifierProvider.notifier)
                            .createTask(Task(
                              tasToDate: selectedDate.toString(),
                              taskFromDate: selectedToDate.toString(),
                              taskFromTime: startTimeController.text,
                              tasToTime: endTimeController.text,
                              priority:
                                  ref.read(selectedtaskPriorityStatusProvider),
                              name: taskNameController.text,
                              description: descriptionController.text,
                            ));
                        Navigator.pop(context);
                        var snackBar = const SnackBar(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color(0xFF652626),
                          content: Text("Task Created SuccesFully"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } catch (e) {
                        print(e);
                        var snackBar = SnackBar(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Color(0xFF652626),
                          content: Text("$e"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  label: "Create New Task")

              // Row with delete icon and close button

              // Title

              // Buttons
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context);
      });
    }
  }
}

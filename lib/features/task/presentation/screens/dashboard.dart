import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_firebase/core/assets.dart';
import 'package:test_firebase/core/utils/icons.dart';
import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/features/task/data/repositories/date_base_key_repositary_impl.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/features/task/presentation/notifier/task_notifier.dart';
import 'package:test_firebase/features/task/presentation/screens/task_detail_screen.dart';
import 'package:test_firebase/features/task/presentation/widgets/create_task_screen.dart';
import 'package:test_firebase/features/task/presentation/widgets/task_card.dart';
import 'package:test_firebase/shared/loader.dart';
import 'package:test_firebase/shared/show_delete_message.dart';
import 'package:test_firebase/src/routes.dart';
import 'package:test_firebase/src/sizedbox.dart';
import 'package:test_firebase/src/theme.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int totalTaskCount = 0;
  String formatDate(String dateString) {
    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(
        dateString); // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
    return formattedDate;
  }

  Future<void> fetchTotalTaskCount() async {
    try {
      final count = await ref.read(taskRepositoryProvider).getTotalTaskCount();
      setState(() {
        totalTaskCount = count;
      });
    } catch (e) {
      // Handle errors
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTotalTaskCount(); // Call the function to fetch the total count
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
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
      body: DefaultTabController(
        length: 4,
        child: Padding(
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
                          ref.watch(taskNotifierProvider).when(
                                error: (message) => Text(message),
                                loading: () => Loader(),
                                success: (tasks) {
                                  return Text(
                                    "${tasks.length}",
                                    style: bodyXLarge.copyWith(
                                        color: Palette.white, fontSize: 33),
                                  );
                                },
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
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black12,
                      Colors.black
                    ], // black to dim black
                  ),
                ),
              ),
              kHight(5),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AddTaskDialogueBox(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create New Task",
                        style: bodyXLarge.copyWith(
                            color: Palette.white, fontSize: 14),
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
                      borderRadius: BorderRadius.circular(12),
                      color: Palette.blue),
                ),
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
                  ref.watch(taskNotifierProvider).when(
                        error: (message) => Text(message),
                        loading: () => Loader(),
                        success: (tasks) {
                          return Text(
                            " (Total ${tasks.length})",
                            style: bodyXLarge.copyWith(
                                color: Palette.black,
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                ],
              ),
              kHight(22),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ButtonsTabBar(
                        onTap: (selectedIndex) async {
                          if (selectedIndex == 0) {
                            ref.read(taskNotifierProvider.notifier).getTasks();
                          } else if (selectedIndex == 1) {
                            ref
                                .read(taskNotifierProvider.notifier)
                                .taskFilter(TaskPriority.high);
                          } else if (selectedIndex == 2) {
                            ref
                                .read(taskNotifierProvider.notifier)
                                .taskFilter(TaskPriority.medium);
                          } else {
                            ref
                                .read(taskNotifierProvider.notifier)
                                .taskFilter(TaskPriority.low);
                          }
                        },
                        borderWidth: 1,
                        borderColor: Palette.blue,
                        splashColor: Colors.transparent,
                        elevation: 0,
                        radius: 12,
                        unselectedBorderColor: Palette.blue,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        unselectedLabelStyle: TextStyle(
                          color: Palette.blue,
                        ),
                        unselectedDecoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        labelStyle: TextStyle(color: Colors.white),

                        // Set selected text color
                        decoration: BoxDecoration(
                          color: Palette.blue,
                        ),
                        height: 44,
                        tabs: [
                          Tab(text: "all"),
                          Tab(text: "high"),
                          Tab(text: "medium"),
                          Tab(text: "low"),
                        ]),
                  ),
                ],
              ),
              kHight(12),
              ref.watch(taskNotifierProvider).when(
                    loading: () => Loader(),
                    success: (tasks) {
                      if (tasks.length == 0) {
                        return Center(
                          child: Text("No Tasks Found"),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            String taskFromDate = formatDate(
                                tasks[index].taskFromDate.toString());
                            String taskToDate =
                                formatDate(tasks[index].tasToDate.toString());

                            print(taskFromDate);
                            return Taskcard(
                              taskName: tasks[index].name,
                              fromdate: taskFromDate,
                              toDate: taskToDate,
                              onLongPres: () async {
                                showDeleteMessage(context,
                                    title: 'Delete the Task !',
                                    onCompleted: () async {
                                  await ref
                                      .read(taskNotifierProvider.notifier)
                                      .deleteTask(tasks[index].id!);
                                },
                                    showCancelButton: true,
                                    message:
                                        "Are you sure want to delete this task ?");
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TaskdetailsScreen(
                                            tasks: tasks[index],
                                          )),
                                );
                              },
                              status:
                                  getTaskPriorityString(tasks[index].priority),
                            );
                          },
                        ),
                      );
                    },
                    error: (message) => Text(message),
                  )
            ],
          ),
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

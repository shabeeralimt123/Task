import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_firebase/core/utils/palette.dart';
import 'package:test_firebase/features/task/domain/model/task_model.dart.dart';
import 'package:test_firebase/features/task/presentation/notifier/task_notifier.dart';

class PriorityStatusContainer extends ConsumerWidget {
  const PriorityStatusContainer({
    Key? key,
    required this.status,
    required this.text,
  }) : super(key: key);

  final String text;
  final TaskPriority status;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentStatus = ref.watch(selectedtaskPriorityStatusProvider);
    return InkWell(
      onTap: () {
        ref.read(selectedtaskPriorityStatusProvider.notifier).state = status;
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: 30,
          padding: EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
              color: currentStatus == status ? Palette.blue : Palette.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: currentStatus == status ? Palette.blue : Palette.blue,
              )),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: currentStatus == status ? Palette.white : Palette.blue,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/ProfileSummeryCard.dart';
import 'package:task_manager/ui/widgets/task_item_cart.dart';

import '../../data/model/tasklistmodel.dart';
import '../../data/network_caller.dart';
import '../../data/network_response.dart';
import '../../utility/urls.dart';


class CancleTaskScreen extends StatefulWidget {
  const CancleTaskScreen({super.key});

  @override
  State<CancleTaskScreen> createState() => _CancleTaskScreenState();
}

class _CancleTaskScreenState extends State<CancleTaskScreen> {

  bool getCancelTaskInProgress = false;
  TaskListModel taskListModel = TaskListModel();

  Future<void> getInCancelTaskList() async {
    getCancelTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getCancelTasks);
    if (response.isSuccess) {
      taskListModel = TaskListModel.fromJson(response.jsonResponse!);
    }
    getCancelTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInCancelTaskList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummeryCard(),
            Expanded(
              child: Visibility(
                visible: getCancelTaskInProgress == false,
                replacement: const Center(child: CircularProgressIndicator()),
                child: ListView.builder(
                  itemCount: taskListModel.taskList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return TaskitemCard(
                      task: taskListModel.taskList![index],
                      onStatusChange: (){

                      },
                      showProgress: (inProgress) {
                        getCancelTaskInProgress = inProgress;
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    );
                  },
                ),
              ),
            ),          ],
        ),
      ),
    );
  }
}

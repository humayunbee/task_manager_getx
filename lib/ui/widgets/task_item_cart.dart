import 'package:flutter/material.dart';
import 'package:task_manager/data/network_caller.dart';
import 'package:task_manager/utility/urls.dart';

import '../../data/model/task.dart';

enum TaskStatus{
  New,
  Progress,
  Completed,
  Cancelled,
}

class TaskitemCard extends StatefulWidget {
  const TaskitemCard({
    super.key, required this.task, required this.onStatusChange, required this.showProgress,
  });

  final Task task;
  final VoidCallback onStatusChange;
  final Function(bool) showProgress;

  @override
  State<TaskitemCard> createState() => _TaskitemCardState();
}

class _TaskitemCardState extends State<TaskitemCard> {

Future<void>updateTaskStatus(String status)async{
  widget.showProgress(true);
final response = await NetworkCaller().getRequest(Urls.updateTaskStatus(widget.task.sId??'', status));
if(response.isSuccess){
  widget.onStatusChange();
}
  widget.showProgress(true);
}


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.task.title??'',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(widget.task.description??''),
            Text('Date: ${widget.task.createdDate}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.task.status??'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                ),
                Wrap(
                  children: [
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(Icons.delete_forever_outlined)),
                    IconButton(onPressed: () {

                      ShowUpdateStatusModel();
                    }, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


void ShowUpdateStatusModel() {

  List<ListTile> items = TaskStatus.values.
      map((e) =>
      ListTile(
        title: Text(e.name),
        onTap: (){
          updateTaskStatus(e.name);
          Navigator.pop(context);
        },
      )).toList();
  showDialog(context: context, builder: (context)
  {
    return AlertDialog(
      title: Text('Update Status'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
      actions: [ButtonBar(
        children: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancle',style: TextStyle(color: Colors.grey),)),
          // TextButton(onPressed: (){}, child: Text('Update')),
        ],
      )],
    );
  });
  }

}








//
// import 'package:flutter/material.dart';
// import 'package:task_manager/data/model/task.dart';
// import 'package:task_manager/data/network_caller.dart';
// import 'package:task_manager/utility/urls.dart';
//
// // enum TaskStatus {
// //   New,
// //   Progress,
// //   Completed,
// //   Cancelled,
// // }
//
// class TaskItemCard extends StatefulWidget {
//   // const TaskItemCard({
//   //   super.key,
//   //   required this.task,
//   //   required this.onStatusChange,
//   //   required this.showProgress,
//   // });
//
//   // final Task task;
//   // final VoidCallback onStatusChange;
//   // final Function(bool) showProgress;
//
//   @override
//   State<TaskItemCard> createState() => _TaskItemCardState();
// }
//
// class _TaskItemCardState extends State<TaskItemCard> {
//   // Future<void> updateTaskStatus(String status) async {
//   //   widget.showProgress(true);
//   //   final response = await NetworkCaller()
//   //       .getRequest(Urls.updateTaskStatus as String);
//   //   if (response.isSuccess) {
//   //     widget.onStatusChange();
//   //   }
//   //   widget.showProgress(false);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.task.title ?? '',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             Text(widget.task.description ?? ''),
//             Text('Date : ${widget.task.createdDate}'),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Chip(
//                   label: Text(
//                     widget.task.status ?? 'New',
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   backgroundColor: Colors.blue,
//                 ),
//                 Wrap(
//                   children: [
//                     // IconButton(
//                     //     onPressed: () {
//                     //
//                     //     },
//                     //     icon: const Icon(Icons.delete_forever_outlined)),
//                     IconButton(
//                         onPressed: () {
//                           // showUpdateStatusModal();
//                         },
//                         icon: const Icon(Icons.edit)),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   // void showUpdateStatusModal() {
//   //   List<ListTile> items = TaskStatus.values
//   //       .map((e) => ListTile(
//   //     title: Text(e.name),
//   //     onTap: () {
//   //       updateTaskStatus(e.name);
//   //       Navigator.pop(context);
//   //     },
//   //   ))
//   //       .toList();
//   //
//   //   showDialog(
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //           title: const Text('Update status'),
//   //           content: Column(
//   //             mainAxisSize: MainAxisSize.min,
//   //             children: items,
//   //           ),
//   //           actions: [
//   //             ButtonBar(
//   //               children: [
//   //                 TextButton(
//   //                   onPressed: () {
//   //                     Navigator.pop(context);
//   //                   },
//   //                   child: const Text(
//   //                     'Cancel',
//   //                     style: TextStyle(
//   //                       color: Colors.blueGrey,
//   //                     ),
//   //                   ),
//   //                 ),
//   //               ],
//   //             )
//   //           ],
//   //         );
//   //       });
//   // }
// }
import '../ui/widgets/task_item_cart.dart';

class Urls{

  static const String _baseurl = 'https://task.teamrabbil.com/api/v1';
  static const String registration = '$_baseurl/registration';
  static const String login = '$_baseurl/login';
  static const String createNewTask = '$_baseurl/createTask';
  static const String getNewTasks = '$_baseurl/listTaskByStatus/New';
  static const String getInProgressTasks = '$_baseurl/listTaskByStatus/InProgress';
  static const String getCompletedTasks = '$_baseurl/listTaskByStatus/Completed';
  static const String getCancelTasks = '$_baseurl/listTaskByStatus/Cancelled';
  static const String getTaskStatusCount = '$_baseurl/taskStatusCount';
  static const String updateProfile = '$_baseurl/profileUpdate';
  // static String getNewTasks = '$_baseurl/listTaskByStatus/${TaskStatus.New.name}';
  // static String getProgressTasks = '$_baseurl/listTaskByStatus/${TaskStatus.Progress.name}';
  static String updateTaskStatus(String taskId, String status) => '$_baseurl/updateTaskStatus/$taskId/$status';

}
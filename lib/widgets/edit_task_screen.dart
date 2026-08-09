import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/widgets/task_form_content.dart';
import 'package:provider/provider.dart';

class EditTaskScreen extends StatelessWidget {
  final Map<String, dynamic> taskToEdit; 

  const EditTaskScreen({super.key, required this.taskToEdit});

  @override
  Widget build(BuildContext context) {
    //final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Edit Task', style: TextStyle(fontFamily: 'Inter', 
        fontWeight: FontWeight.bold,
        color:Theme.of(context).colorScheme.onSurface
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
           color: Theme.of(context).colorScheme.onSurface,
           ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TaskFormContent(taskToEdit: taskToEdit), 
        ),
      ),
    );
  }
  
}
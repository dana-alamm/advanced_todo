
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/widgets/task_form_content.dart';
import 'package:provider/provider.dart';

class NewTaskBottomSheet extends StatelessWidget {
  const NewTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeprovider=Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
        child: const TaskFormContent(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class TaskFormContent extends StatefulWidget {
  final Map<String,dynamic>? taskToEdit;

  const TaskFormContent({super.key,
   this.taskToEdit});

  @override
  State<TaskFormContent> createState() => _TaskFormContentState();
}

class _TaskFormContentState extends State<TaskFormContent> {
  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _notesController=TextEditingController();
  final TextEditingController _dateController=TextEditingController();
  DateTime? _selectedDate;
  String selectedPriority ='High';
  String selectedCategory='Personal';
  bool get isEditMode=>widget.taskToEdit!=null;

  @override
  void initState(){
    super.initState();
    if(isEditMode){
      final task=widget.taskToEdit!;
      _titleController.text=task['title']??'';
      _notesController.text=task['notes']??'';
      selectedPriority=task['priority']??'';
      selectedCategory=task['category']??'';
      if(task['dueDate']!=null){
        _selectedDate=task['dueDate'] is DateTime?task['dueDate']:DateTime.parse(task['dueDate']);
        _dateController.text="${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}";
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    //final themeprovider=Provider.of<ThemeProvider>(context);
    final isDark=Theme.of(context).brightness==Brightness.dark;
    final textColor=Theme.of(context).colorScheme.onSurface;
    final fieldBgColor=isDark
    ?Theme.of(context).colorScheme.surface
    :const Color(0xFFF8FAFC);
    final borderColor=Theme.of(context).dividerColor;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(!isEditMode)...[
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color:Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height:16),
          ],
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isEditMode ?'Edit Task':'Add Task',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),

            ),
            if(!isEditMode)
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : const Color(0xFFF0F4F8),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: ()=>Navigator.pop(context),
                 icon:const Icon(Icons.close,size: 18,color:AppColors.greyColor),
                 ),
              
            ),

            
          ],
         ),
         const SizedBox(height: 12,),
         Divider(color:borderColor,thickness: 1,height: 1,),
         const SizedBox(height: 20,),

         TextField(
          controller: _titleController,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:textColor,
          ),
          decoration: InputDecoration(
            hintText: isEditMode?'Edit task title':'Add new task',
            hintStyle:  TextStyle(color: textColor.withOpacity(0.4)),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:borderColor),
              
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color: borderColor)
            ),

          ),
         ),
         const SizedBox(height: 16,),
         TextField(
          controller: _notesController,
          maxLines: 3,
          style: const TextStyle(fontFamily: 'Inter'),
          decoration: InputDecoration(
            hintText: 'Add a note(optional)',
            hintStyle:  TextStyle(color: textColor.withOpacity(0.4)),
            filled:true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:  BorderSide(color:borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
               borderSide:  BorderSide(color: borderColor)),
          ),
         ),
         const SizedBox(height: 20,),

         const Text(
        'Priority',
        style:TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColors.grey3Color,
        ),
         ),
         const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              priorityButton(
                label: 'High', 
                isSelected: selectedPriority=='High', 
                selectedBgColor:  const Color(0xFFFF3B30), 
                selectedTextColor: Colors.white,
                 unselectedBgColor: const Color(0xFFFFF5F5), 
                 unselectedBorderColor: const Color(0xFFFFD6D6),
                  unselectedTextColor: const Color(0xFFFF3B30), 
                  onTap: (){
                    setState(() {
                      selectedPriority='High';
                    });
                  }),
                  const SizedBox(width: 10,),
                  priorityButton(
                    label: 'Medium',
                   isSelected: selectedPriority=='Medium', 
                   selectedBgColor: const Color(0xFFFFB020),
                   selectedTextColor: Colors.white,
                   unselectedBgColor: const Color(0xFFFFF9E6), 
                   unselectedBorderColor: const Color(0xFFFFE0B2), 
                   unselectedTextColor:const Color(0xFFE67E22),

                   onTap: (){
                    setState(() {
                      selectedPriority='Medium';
                    });
                   }),
                    const SizedBox(width: 10,),
                            priorityButton(
                             label: 'Low',
                            isSelected: selectedPriority=='Low',
                            selectedBgColor: const Color(0xFF1ABC9C),
                           selectedTextColor: Colors.white,
                           unselectedBgColor: const Color(0xFFE8F8F5),
                           unselectedBorderColor: const Color(0xFFA3E4D7),
                           unselectedTextColor: const Color(0xFF1ABC9C),
                           onTap: () {
                             setState(() {
                               selectedPriority='Low';
                             });
                           },
    ),

            ],
          ),
          const SizedBox(height: 20,),
          const Text(
            'Category',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color:AppColors.grey3Color,
            ),
          ),
          const SizedBox(height: 9,),
         Row(
          children: [
            categoryButton(
              label: 'Work', 
              isSelected: selectedCategory=='Work',
               selectedBgColor: AppColors.purple,
                unSelectedBgColor: const Color(0xFFF8FAFC),

                 selectedTextColor: Colors.white,
                  unSelectedTextColor:Colors.black,
                   onTap: (){
                    setState(() {
                      selectedCategory='Work';
                    });
                   }),
                   SizedBox(width: 12,),
                    categoryButton(
                        label: 'Personal', 
                        isSelected: selectedCategory=='Personal', 
                        selectedBgColor: AppColors.purple,
                         selectedTextColor: Colors.white, 
                         unSelectedTextColor: Colors.black,
                         unSelectedBgColor:const Color(0xFFF8FAFC),
                          onTap: (){
                            setState(() {
                              selectedCategory='Personal';
                            });
                          },
                          ),

          ],
         ),
         SizedBox(height: 9,),
         Row(
          children: [
            categoryButton(
              label:'Shopping' ,
               isSelected: selectedCategory=='Shopping', 
               selectedBgColor: AppColors.purple,
                unSelectedBgColor: const Color(0xFFF8FAFC),
                selectedTextColor: Colors.white,
                 unSelectedTextColor: Colors.black, 
                 onTap: (){
                  setState(() {
                    selectedCategory='Shopping';
                  });
                 }),
                 SizedBox(width: 12,),
                 categoryButton(
                  label: 'Study',
                   isSelected: selectedCategory=='Study', 
                   selectedBgColor: AppColors.purple, 
                   unSelectedBgColor: const Color(0xFFF8FAFC),
                   selectedTextColor: Colors.white, 
                   unSelectedTextColor: Colors.black, 
                   onTap: (){
                    setState(() {
                      selectedCategory='Study';
                    });
                   })
          ],
         ),
         SizedBox(height: 9,),
          Row(
                            children: [
                           categoryButton(
                        label: 'Sports', 
                        isSelected: selectedCategory=='Sports', 
                        selectedBgColor: AppColors.purple,
                         selectedTextColor: Colors.white, 
                         unSelectedTextColor: Colors.black,
                         unSelectedBgColor:const Color(0xFFF8FAFC),
                          onTap: (){
                            setState(() {
                              selectedCategory='Sports';
                            });
                             },
                          ),
  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()),
        ],
      ),
      const SizedBox(height: 20,),
      const Text(
        'Due date',
         style: TextStyle(
            fontFamily: 'Inter',
             fontSize: 15, 
             fontWeight: FontWeight.w700,
              color: AppColors.grey3Color)),
     const SizedBox(height: 9,),
     TextField(
      controller: _dateController,
      readOnly: true,
      onTap: () async{
        DateTime? pickedDate=await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
           firstDate: DateTime.now(),
            lastDate: DateTime(2030),
        );
        if(pickedDate!=null){
          setState(() {
            _selectedDate=pickedDate;
            _dateController.text="${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
          });
        }

        
            
            
            
            
            
      },
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,

      ),
      decoration: InputDecoration(
        hintText: 'Select a date',
        hintStyle: const TextStyle(color: Color(0xFF8A94A6)),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
         suffixIcon: const Icon(Icons.calendar_today, size: 18, color: Color(0xFF8A94A6)),
                           border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                          ),
                         enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: const BorderSide(color: Color(0xFFE2E8F0)),


      ),
     )
     ),

        SizedBox(height: 15,),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: (){
              if(_titleController.text.trim().isNotEmpty){
                final taskProvider=Provider.of<TaskProvider>(context,listen: false);
                if(isEditMode){
                  taskProvider.updateTask(
                    id: widget.taskToEdit!['id'],
                     newTitle: _titleController.text.trim(), 
                     newNotes: _notesController.text.trim(),
                      newPriority: selectedPriority,
                       newCategory: selectedCategory, 
                       newDueDate: _selectedDate??DateTime.now());
                }else{
                  taskProvider.addTask(
                    title: _titleController.text.trim(), 
                    notes: _notesController.text.trim(),
                    priority:selectedPriority , 
                    category: selectedCategory,
                     dueDate: _selectedDate??DateTime.now());
                }
                Navigator.pop(context);
              }
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: AppColors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
            ) ,
             child: Text(isEditMode?
             'Save Changes' : 'Add Task',style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w700,
             ),)),
        )
        ],
      ),
    );
  }
}
class priorityButton extends StatelessWidget {

  final String label;
  final bool isSelected ;
  final Color selectedBgColor;
  final Color selectedTextColor;
  final Color unselectedBgColor;
  final Color unselectedBorderColor;
  final Color unselectedTextColor;
  final VoidCallback onTap;

  const priorityButton({super.key, 
  required this.label,
   required this.isSelected,
    required this.selectedBgColor,
     required this.selectedTextColor,
      required this.unselectedBgColor, 
      required this.unselectedBorderColor, 
      required this.unselectedTextColor,
       required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color:isSelected?selectedBgColor:unselectedBgColor,
            borderRadius: BorderRadius.circular(10),
            border: isSelected?null:Border.all(
              color:const Color(0xFFE2E8F0)
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              color:isSelected?selectedTextColor
              :unselectedTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      )
      );
  }
}
class categoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
   final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  
  final VoidCallback onTap;
  const categoryButton({
    super.key, 
    required this.label, 
    required this.isSelected, 
    required this.selectedBgColor, 
    required this.unSelectedBgColor,
     required this.selectedTextColor, 
     required this.unSelectedTextColor, 
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap:onTap,
        child: Container(
          width: 171,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:isSelected
            ?selectedBgColor
            :unSelectedBgColor,
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
               fontFamily: 'Inter',
              color:isSelected ? selectedTextColor : unSelectedTextColor,
              fontWeight: FontWeight.w700,

            ),
          ),
        ),
      )
      );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/providers/task_provider.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:provider/provider.dart';

class NewTaskBottomSheet extends StatefulWidget {
  const NewTaskBottomSheet({super.key});

  @override
  State<NewTaskBottomSheet> createState() => _NewTaskBottomSheetState();
}

class _NewTaskBottomSheetState extends State<NewTaskBottomSheet> {
  final TextEditingController _taskController=TextEditingController();
  final TextEditingController _notesController=TextEditingController();
  final TextEditingController _dateController=TextEditingController();
  DateTime? _selectedDate;
   String selectedPriority = 'High';
   String selectedCategory='Personal';
  @override
  Widget build(BuildContext context) {
    final themeprovider=Provider.of<ThemeProvider>(context);
   
    return Padding(
      padding: EdgeInsets.only(
        bottom:MediaQuery.of(context).viewInsets.bottom,
         ),
         child: Container(
          decoration: BoxDecoration(
            color:themeprovider.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
          child:SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Task',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: themeprovider.textColor,

                        
                      ),
                    ),
                   Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color:const Color(0xFFF0F4F8),
                      shape: BoxShape.circle,

                    ),
                    child: IconButton(
                      padding:EdgeInsets.zero,
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      icon: const Icon(
                        Icons.close,
                        size: 18, 
                        color: AppColors.greyColor,
               
                      )
                      ),
                   ),
                  
                  ],
                ),
                SizedBox(height: 12,),
                const Divider(
                  color: Color(0xFFF1F5F9), 
                  thickness: 1,             
                  height: 1,
                ),
                SizedBox(height: 20,),

                TextField(
                  controller: _taskController,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                   // color:themeprovider.textColor,
                  ),
                    decoration: InputDecoration(
                      hintText: 'Add new task',
                     hintStyle: const TextStyle(color: Color(0xFF8A94A6)),
                     filled: true,
                     fillColor: const Color(0xFFF8FAFC),
                     contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                     ),
                     enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                     ),
                    ),
                    const SizedBox(height: 16,),

                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    style: TextStyle(
                      fontFamily: 'Inter', 
                    ),
                    decoration: InputDecoration(
                      hintText: 'Add a note (optional)',
                  hintStyle: const TextStyle(color: Color(0xFF8A94A6)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                  const SizedBox(height: 20,),
                  Text(
                    'Priority',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      color: AppColors.grey3Color,

                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     PriorityButton(
                      label: 'High', 
                      isSelected: selectedPriority=='High',
                       selectedBgColor: const Color(0xFFFF3B30), 
                       selectedTextColor: Colors.white, 
                       unselectedBgColor: const Color(0xFFFFF5F5),
                        unselectedBorderColor: const Color(0xFFFFD6D6), 
                        unselectedTextColor: const Color(0xFFFF3B30),
                        onTap: () {
                          setState(() {
                            selectedPriority='High';
                          });
                        },
                      ),
                      const SizedBox(width: 10,),
                      PriorityButton(
                        label: 'Medium',
                         isSelected: selectedPriority=='Medium',
                          selectedBgColor: const Color(0xFFFFB020),
                           selectedTextColor: Colors.white,
                            unselectedBgColor: const Color(0xFFFFF9E6), 
                            unselectedBorderColor: const Color(0xFFFFE0B2), 
                            unselectedTextColor: const Color(0xFFE67E22),
                            onTap: () {
                              setState(() {
                                selectedPriority='Medium';
                              });
                            },
                            ),
                            const SizedBox(width: 10,),
                            PriorityButton(
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
                  SizedBox(height: 20,),
                  Text(
                    'Category',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      color: AppColors.grey3Color,

                    ),
                  ),
                  const SizedBox(height: 9,),
                  
                  Row(
                    children: [
                      CategoryButton(
                        label: 'Work', 
                        isSelected: selectedCategory=='Work', 
                        selectedBgColor: AppColors.purple,
                         selectedTextColor: Colors.white, 
                         unSelectedTextColor: Colors.black,
                         unSelectedBgColor:const Color(0xFFF8FAFC),
                       
                          onTap: (){
                            setState(() {
                              selectedCategory='Work';
                            });
                          },
                          ),
                          SizedBox(width: 12,),
                           CategoryButton(
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
                               CategoryButton(
                               label: 'Shopping', 
                              isSelected: selectedCategory=='Shopping', 
                              selectedBgColor: AppColors.purple,
                              selectedTextColor: Colors.white, 
                              unSelectedTextColor: Colors.black,
                              unSelectedBgColor:const Color(0xFFF8FAFC),
                               onTap: (){
                                setState(() {
                                  selectedCategory='Shopping';
                                });
                                 },
                               ),
                             SizedBox(width: 12,),
                        

                           CategoryButton(
                        label: 'Study', 
                        isSelected: selectedCategory=='Study', 
                        selectedBgColor: AppColors.purple,
                         selectedTextColor: Colors.white, 
                         unSelectedTextColor: Colors.black,
                         unSelectedBgColor:const Color(0xFFF8FAFC),
                          onTap: (){
                            setState(() {
                              selectedCategory='Study';
                            });
                          },
                          ),
                             ],
                           ),
                           SizedBox(height: 9,),
                           Row(
                            children: [
                           CategoryButton(
                        label: 'Soprts', 
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
                           SizedBox(height: 20,),
                          
                             const Text(
                                'Due date',
                                style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                               letterSpacing: 1.0,
                               color: AppColors.grey3Color,
                                ),
                              ),
                              SizedBox(height: 9,),
                              TextField(
                              controller: _dateController,
                              readOnly: true,

                              onTap: ()async{
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
                               // color:themeprovider.textColor,
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
  ),
                              ),
                              SizedBox(height: 15,),
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(_taskController.text.trim().isNotEmpty){
                                    Provider.of<TaskProvider>(context,listen: false).addTask(
                                      title: _taskController.text.trim(),
                                      notes: _notesController.text.trim(),
                                      priority: selectedPriority,
                                       category: selectedCategory,
                                        dueDate: _selectedDate ??DateTime.now(),
                                        );
                                      Navigator.pop(context);
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please enter a task title!')),
                                  );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.purple,
                                  foregroundColor: Colors.white,
                                  elevation: 2,
                                  shadowColor: AppColors.purple.withOpacity(0.4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(16),

                                  ),
                                ),
                                 child: Text(
                                  'Add Task',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700, 
                              
                                  ),
                                  )),
                            )
              ],
                            
                           
              

              
            ),
          ),
         ),
    );
    
  }
 
}
 class PriorityButton extends StatelessWidget{
  final String label;
  final bool isSelected;
  final Color selectedBgColor;
  final Color selectedTextColor;
  final Color unselectedBgColor;
  final Color unselectedBorderColor;
  final Color unselectedTextColor;
  final VoidCallback onTap;

   PriorityButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.selectedBgColor,
    required this.selectedTextColor,
    required this.unselectedBgColor,
    required this.unselectedBorderColor,
    required this.unselectedTextColor, 
    required this.onTap,
  });

  
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
            border: isSelected?null:Border.all(color: const Color(0xFFE2E8F0)),
          ),
          alignment: Alignment.center,
          child:Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              color:isSelected ? selectedTextColor : unselectedTextColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ),
      )
      );
  }
  
 }
 class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color selectedBgColor;
  final Color unSelectedBgColor;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  //final Color borderSideColor;
  final VoidCallback onTap;


  const CategoryButton({super.key, 
  required this.label,
   required this.isSelected,
    required this.selectedBgColor,
     required this.selectedTextColor, 
     required this.unSelectedTextColor,
     required this.onTap, required this.unSelectedBgColor, 
      //required this.borderSideColor,
    });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:GestureDetector(
      onTap: onTap,
      child: Container(
        width: 171,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:isSelected?selectedBgColor:unSelectedBgColor,
         
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
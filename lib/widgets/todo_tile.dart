import 'package:flutter/material.dart';
import 'package:flutter_application_11/core/models/task_model.dart';
import 'package:flutter_application_11/core/providers/theme_provider.dart';
import 'package:flutter_application_11/core/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatefulWidget {
  final TaskModel task;
  final VoidCallback onStateChanged;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onPinToggled;

  const TodoTile({super.key,
   required this.task,
   required this.onStateChanged,
   required this.onDelete,
   required this.onEdit,
    required this.onPinToggled
      });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _isExpanded=false;
 
  @override
  Widget build(BuildContext context) {
     final themeProvider=Provider.of<ThemeProvider>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin:const EdgeInsets.only(bottom: 12) ,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: themeProvider.backgroundColor,
        border: BoxBorder.all(
          color:widget.task.isPinned
          ? AppColors.borderPurple
          : AppColors.borderGrey,
          width:1.5,
          
        ),
        boxShadow: [
          BoxShadow(
            color:widget.task.isPinned
            ?Colors.purple.withOpacity(0.04)
            :Colors.black.withOpacity(0.01),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.drag_indicator,
                color:Colors.grey.shade400,
                size: 20,
              ),
              const SizedBox(width: 8,),
               GestureDetector(
                onTap:widget.onStateChanged,
                child: AnimatedContainer(
                  duration:  const Duration(milliseconds: 200),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.task.isDone?Colors.green:Colors.purple.shade100,
                   
                    ),
                  child: widget.task.isDone
                  ?const Icon(Icons.check,size:16,color:Colors.white)
                  :null,
                  ),
                ),
            ],
            ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style:TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        
                          decoration: widget.task.isDone?TextDecoration.lineThrough:null,
                        color:widget.task.isDone?
                        Colors.grey
                        :themeProvider.textColor,
                        ),
                        ),
                        const SizedBox(width: 6,),

                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            decoration: BoxDecoration(
                              color:widget.task.prioritBgColor,
                              border: Border.all(
                                color:widget.task.priorityBorderColor,width: 1
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color:widget.task.priorityColor,
                                    shape: BoxShape.circle,
                                    

                                  ),
                                ),
                                const SizedBox(width: 4,),
                                Text(
                                  widget.task.priority,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            
                            ),
                            const SizedBox(width: 8,),
                            
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                             Text(
                             "${widget.task.categoryEmoji}",
                             style: const TextStyle(fontSize: 14),
                             ),
                             Text(
                              widget.task.category,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey3Color,
                              ),
                             )

                             
                              ],
                            ),
                            SizedBox(width: 8,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.calendar_today_outlined,size:14,color:Colors.orange),
                                SizedBox(width: 4,),
                                Text(
                          "${widget.task.dueDate.day}/${widget.task.dueDate.month}", 
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                              ],
                            )
                          ],
                        ),

                        if( widget.task.notes.trim().isNotEmpty)...[
                          const SizedBox(height: 8,),
                         AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: Text(
                            widget.task.notes,
                            maxLines: _isExpanded ? null:1,
                            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                            style:TextStyle(
                              fontFamily: 'Inter',
                              fontSize:12,
                              color:widget.task.isDone
                              ? Colors.grey.shade500
                              : Colors.grey,
                            )
                          ),
                          )
                        ],

                    ],
                    
                  ),
                
                ),
                SizedBox(width: 15,),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  GestureDetector(
                    onTap:widget.onPinToggled,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:widget.task.isPinned?Colors.purple.shade50:Colors.transparent,
                        shape: BoxShape.circle
                      ),
                      child:Icon(
                        widget.task.isPinned?Icons.push_pin:Icons.push_pin_outlined,
                        color:widget.task.isPinned?Colors.purple:Colors.grey.shade400,
                        size:20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4,),

                 // if(_isExpanded && widget.task.isDone)
                  IconButton(
                    onPressed:widget.onEdit, 
                    icon: const Icon(Icons.edit_outlined
                    ),
                    color:Colors.blueGrey,
                    iconSize: 20.0,
                    ),

                    IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                onPressed: widget.onDelete,
              ),

              IconButton(
                icon: Icon(
                  _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.grey,),
                 onPressed: () { 
                  setState(() {
                    
                    _isExpanded=!_isExpanded;
                  });
                  },
              ),
              

                  ],
                )


        
            ],
               
          ),
            
          
        
      );
      
  }
  
}
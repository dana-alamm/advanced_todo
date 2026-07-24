import 'package:flutter/material.dart';
import 'package:flutter_application_11/provider/auth_provider.dart';
import 'package:flutter_application_11/theme/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _taskController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final authProvider=Provider.of<AuthProvider>(context);
    return Scaffold(
  // backgroundColor: AppColors.lightBackGround,
  backgroundColor: authProvider.isDarkMode?AppColors.darkMode:AppColors.lightBackGround,
   body: SafeArea(
    child: Column(
      children: [
        Stack( 
          clipBehavior: Clip.none,
          children: [ 
        Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
           // borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
            image:AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
             ),
          ),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              
              Text(
                'To Do',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 32/24,
                ),
              ),
             
              
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child:GestureDetector(
                  onTap: () {
                    authProvider.toggleTheme();
                  },
                  child: Icon(
                    authProvider.isDarkMode?Icons.nightlight_round:Icons.wb_sunny,
                   
                    color:Colors.white.withOpacity(0.9),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -40,
          left: 24,
          right:24,
          
          child:Container(
            height: 80,
            width: 349,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              //color: Colors.white,
               color:authProvider.isDarkMode?AppColors.bigDarkBox:Colors.white,
            ),
            child: TextField(
               controller: _taskController,
               style: TextStyle(
                color: authProvider.isDarkMode ? Colors.white : Colors.black,
    fontFamily: 'Roboto',
    fontSize: 16,
               ),
              decoration: InputDecoration(
                
                border: InputBorder.none,
                hintText: 'Add a new task...',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                 // color:Colors.grey,
                 color: authProvider.isDarkMode ? Colors.white : Colors.grey,
                
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                
                suffixIcon: Padding(
                  padding:EdgeInsets.only(right:8.0),
                  child: IconButton(
                    icon: const Icon(Icons.add, size: 28),
                   // color: AppColors.blueColor,
                    color:authProvider.isDarkMode?Colors.white:AppColors.blueColor,
                    onPressed: () {
                   if(_taskController.text.trim().isNotEmpty){
                    Provider.of<AuthProvider>(context,listen: false)
                    .addTask(_taskController.text);
                    _taskController.clear();
                   }
                  },
                  ),
                  ),
              ),
            
            ),
          )
          ),
          ],
        
        ),
        SizedBox(height: 60,),
        
        Expanded(
          child:Consumer<AuthProvider>(
            builder: (context, authProvider, child) { 
              
          
            return SingleChildScrollView(
              child:Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color:Colors.white,
                      color:authProvider.isDarkMode?AppColors.bigDarkBox:Colors.white,
                      borderRadius: BorderRadius.circular(16),
            
                    ),
                    child: Column(
                      children: [
                        authProvider.filteredTasks.isEmpty
                        ?Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20,),
                            Image.asset(
                              'assets/images/no_tasks.jpg',
                              height: 120,

                            ),
                            const SizedBox(height: 16),
                Text(
                  'No tasks here!',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: authProvider.isDarkMode ? Colors.white70 :const Color.fromARGB(137, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Enjoy your free time or add a new task ☕',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 13,
                    color: authProvider.isDarkMode ? Colors.white54 : const Color.fromARGB(92, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 20),
                          ],
                        )
                        :ListView.builder(
                          
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:authProvider.filteredTasks.length ,
                          itemBuilder: (context,index){
                            final task=authProvider.filteredTasks[index];
                         return Padding(
                          //key: ObjectKey(task),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child:Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  authProvider.toggleTaskStatus(index);
                                
                                },
                              
                              child:Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: task.isDone
                                  ?const LinearGradient(
                                    colors:[
                                      Color(0xff8A46E5), 
                                      Color(0xff52A4F9),
                                    ],
                                    begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                    :null,
                                    border: task.isDone?
                                    null:Border.all(
                                   color: Colors.grey[400]!, 
                                   width: 2,
            ),
                                ),
                                child: task.isDone
                                ? const Icon(
                                  Icons.check,
                                  color:Colors.white,
                                  size:18,
                                )
                                :null,
                              ),
                              ),
                              SizedBox(width: 12,),
                              
                               Expanded(
                                child: Text(
                                  task.title,
                                style:TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  decoration: task.isDone
                                  ?TextDecoration.lineThrough
                                  :TextDecoration.none,
                                  decorationColor: authProvider.isDarkMode ? Colors.white : Colors.black,
                                  decorationThickness: 2.0,
                                  color:authProvider.isDarkMode ? Colors.white : Colors.black,
                                 
                                ),),
                              
                                ),
                                  GestureDetector(
                                    onTap: () {
                                      authProvider.deleteTask(index);
                                      
                                    },
                                    child: Icon(
                                    Icons.close,
                                    color: Colors.grey[400],
                                     size: 20,
                                       ),
                                  ),
                            ],
                          ),
                          
                          );
                          },
                          
                          
                          ),
                          SizedBox(height: 30,),
            
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                '${authProvider.filteredTasks.length} Items result',
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: authProvider.isDarkMode?Color(0xffAEAEAE):Colors.black,
                                ),
                                
                              ),
                              TextButton.icon(
                                onPressed: (){
                                  authProvider.clearCompletedTasks();
                                },
                                icon: const Icon(Icons.delete_forever_outlined,color:Colors.red,size:18),
                                 label: const Text(
                                  'Clear Completed',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color:Colors.red,
                                    fontSize: 14,
                                  ),
                                 )),
            
                            ],),
                            
                      ],
                    ),
                      
                      
                  ),
                  SizedBox(height: 16,),
            
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(8),
                    height: 68,
                    width: 360,
                    decoration: BoxDecoration(
                      //color:Colors.white,
                      color: authProvider.isDarkMode ? AppColors.bigDarkBox : Colors.white,
                      
                    ),
                    child: Row(
                      children: [
            
                        Expanded(
                          child: GestureDetector(
                            onTap: ()=> authProvider.changeFilter('All'),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color:authProvider.currentFilter=='All'
                                ?AppColors.blueColor
                                //:AppColors.grey2Color,
                                :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,
                                borderRadius: BorderRadius.circular(8),
                                
                                        
                              ),
                              child: Center(
                                child:Text('All',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  color: (authProvider.currentFilter=='All'||authProvider.isDarkMode)
                                  ?Colors.white
                                  :Colors.black,

                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Expanded(
                          child: GestureDetector(
                            onTap: ()=>authProvider.changeFilter('Active'),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color:authProvider.currentFilter=='Active'
                                ?AppColors.blueColor
                               // :AppColors.grey2Color,
                                :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,

                                borderRadius: BorderRadius.circular(8),
                                        
                              ),
                              child: Center(
                                child:Text('Active',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                 color: (authProvider.currentFilter=='Active'||authProvider.isDarkMode)
                                  ?Colors.white
                                  :Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                          ),
                          ),
                           SizedBox(width: 8,),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => authProvider.changeFilter('Completed'),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color:authProvider.currentFilter=='Completed'
                                ?AppColors.blueColor
                                //:AppColors.grey2Color,
                                 :authProvider.isDarkMode?Colors.black:AppColors.grey2Color,
                                borderRadius: BorderRadius.circular(8),
                                        
                              ),
                              child: Center(
                                child:Text('Completed',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                 color: (authProvider.currentFilter=='Completed'||authProvider.isDarkMode)
                                  ?Colors.white
                                  :Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),),
                              ),
                            ),
                          ),
                          )
                      ],
                    ),
                  )
                ],
              )
            );
            }
          ),
          ),
        
      ],
      
    ),
    ),
    );
  }
}
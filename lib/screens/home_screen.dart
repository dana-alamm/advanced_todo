import 'package:flutter/material.dart';
import 'package:flutter_application_11/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: AppColors.lightBackGround,
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
                  fontFamily: 'Rototo',
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
                child:Icon(
                  Icons.nightlight_round,
                  color:Colors.white.withOpacity(0.9),
                  size: 24,
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
              color: Colors.white,
            ),
            child: TextField(
               
              decoration: InputDecoration(
                
                border: InputBorder.none,
                hintText: 'Add a new task...',
                hintStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 28),
                
                suffixIcon: Padding(
                  padding:EdgeInsets.only(right:8.0),
                  child: IconButton(
                    icon: const Icon(Icons.add, size: 28),
                    color: AppColors.blueColor,
                    onPressed: () {
     
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
          child:SingleChildScrollView(
            child:Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(16),

                  ),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:5 ,
                        itemBuilder: (context,index){
                       return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child:Row(
                          children: [
                            Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey[400],
                            ),
                            SizedBox(width: 12,),
                            
                            const Expanded(
                              child: Text('to-do item',
                              style:TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),),
                            
                              ),
                                Icon(
                            Icons.close,
                           color: Colors.grey[400],
                           size: 20,
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
                            const Text(
                              '6 Items result',
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                              
                            ),
                            TextButton.icon(
                              onPressed: (){},
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
                    color:Colors.white,
                    
                  ),
                  child: Row(
                    children: [

                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color:AppColors.blueColor,
                            borderRadius: BorderRadius.circular(8),

                          ),
                          child:const Center(
                            child:Text('All',style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color:AppColors.grey2Color,
                            borderRadius: BorderRadius.circular(8),

                          ),
                          child:const Center(
                            child:Text('Active',style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                        ),
                         SizedBox(width: 8,),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color:AppColors.grey2Color,
                            borderRadius: BorderRadius.circular(8),

                          ),
                          child:const Center(
                            child:Text('Completed',style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          ),
                        ),
                        )
                    ],
                  ),
                )
              ],
            )
          )
          ),
        
      ],
      
    ),
    ),
    );
  }
}
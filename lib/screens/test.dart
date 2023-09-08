import 'package:flutter/material.dart';
import 'package:quisapp/widgets/custom_button.dart';


class Mytest extends StatelessWidget {
  const Mytest({super.key});
  static const routeName="/test";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: 

  SafeArea(child: 
  Stack(
  
    children: [
    Container(height: double.infinity,width: double.infinity,color:const Color.fromARGB(255, 218, 214, 204),),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30)
                      ,
                      
                      bottomLeft: Radius.circular(30))),
                  
                  height :250,width: double.infinity,

                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      padding:EdgeInsets.all(40),
                                      
                                      child: Image.asset("images/cup.png",)),

                  
                  
                  ),
              


            Positioned
            
            (
              left:50 ,
              top: 190,
              
              child: Container(height: 280,width: 280,
              decoration: BoxDecoration(
                boxShadow:[BoxShadow(
                  offset: const Offset(0, 4),
                  spreadRadius: 5,
                  blurRadius: 5,
                  color: const Color.fromARGB(255, 29, 180, 255).withOpacity(0.3))],
                color: Colors.white,
                
                borderRadius: BorderRadius.circular(30)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 8,),
                  
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children:
                   [
                    
                    
                     Text("score",style:TextStyle(fontSize: 35),), Icon(Icons.star,color: Colors.orange,size: 60,)


                  ],),
                  SizedBox(height: 50,),
                

                Text("qusis 7/10",style:TextStyle(fontSize: 35)),



              ],),
              
              )),
              Positioned(
                bottom: 20,
                left: 60,

                
                child: CustomButton(
                  width: 220,
                  
                  text: "حاول",
                  onPressed: (){
              
                  },
              
              
                ),
              )









  ])
  
  ,)
    
      



    );
  }
}
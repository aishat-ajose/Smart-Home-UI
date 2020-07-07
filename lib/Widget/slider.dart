// import 'package:flutter/material.dart';

// Widget slider2(){
//     return Container(
//       margin: EdgeInsets.only(left:150),
//       width: 250,
//       height: 100,
//       child: Swiper(
//         itemCount: 10,
//         scrollDirection: Axis.horizontal,
//         onIndexChanged: (val){
//           setState(() {
//             _currentValue ++;
//           });
//         },
//         itemBuilder: (BuildContext context,int index){
//           return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("${_currentValue - 3}", style: TextStyle(fontSize:10 ),),
//             SizedBox(width: 10,),
//             Text("${_currentValue - 2}", style: TextStyle(fontSize:15),),
//             SizedBox(width: 10,),
//             Text("${_currentValue - 1}", style: TextStyle(fontSize:25 ),),
//             SizedBox(width: 5,),
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//               elevation: 10,
//               child: Container(
//                 height: 60,
//                 width: 60,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color.fromRGBO(108, 110, 245, 1)
//                 ),
//                 child: Center(child: Text("$_currentValue", style: TextStyle(fontSize:30, color: Colors.white))),
//               ),
//             ),
//             SizedBox(width: 5,),
//             Text("${_currentValue + 1}", style: TextStyle(fontSize:25 ),),
//             SizedBox(width: 10,),
//             Text('${_currentValue + 2}', style: TextStyle(fontSize:15 ),),
//             SizedBox(width: 10,),
//             Text('${_currentValue + 3}', style: TextStyle(fontSize:10 ),),
//           ],
//         );
//       }  
//       ),
//     );
//   }

//   Widget se(String name, double elevation){
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       color: Colors.white,
//       elevation: elevation,
//       child: Container(
//         alignment: Alignment.center,
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//           // shape: BoxShape.circle,
//           // color: Color.fromRGBO(67,78,93, 1),
//         ),
//         child: Text(name),        
//       ),
//     );
//   }
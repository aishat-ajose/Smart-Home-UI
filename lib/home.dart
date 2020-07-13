
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  TextStyle sty = TextStyle(fontSize:90, color: Colors.white, fontWeight: FontWeight.w200);
class _HomePageState extends State<HomePage> {
  List<String>  options = ["Temperature","Humidity", 'Electricity', 'Router'];
  int _currentValue = 24;
  List<String> roomlist = ['Living Room', 'Bedroom', 'Kitchen'];
  Map<String, dynamic> option = {
    'Temperature': [Icon(Icons.wb_sunny, size: 40, color: Colors.grey, ), Text("24°c", style:sty,),Icon(Icons.wb_sunny, size: 15, color: Colors.grey, )],
    'Humidity': [Icon(Icons.wb_cloudy,size: 40, color: Colors.grey,), Text("46%", style:sty), Icon(Icons.wb_cloudy,size: 15, color: Colors.grey,)],
    'Electricity': [Icon(Icons.lightbulb_outline,size: 40, color: Colors.grey,), Text("24°c", style:sty),Icon(Icons.lightbulb_outline,size: 15, color: Colors.grey,)],
    'Router': [Icon(Icons.wifi,size: 40, color: Colors.grey,), Text("24°c", style:sty),Icon(Icons.wifi,size: 15, color: Colors.grey,)],
  };
  List<String> low = [];
  String current = 'Temperature';
  List<String> high = ['Humidity','Electricity'];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child:Column(
          children: [
            slider(context),
            Container(
              decoration: BoxDecoration(
                // border: Border.all(style:BorderStyle.solid)
              ),
              margin: EdgeInsets.only(left:145),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${_currentValue - 3}", style: TextStyle(fontSize:10, color: Colors.grey[200]),),
                  SizedBox(width: 10,),
                  Text("${_currentValue - 2}", style: TextStyle(fontSize:15,color: Colors.grey[400]),),
                  SizedBox(width: 10,),
                  Text("${_currentValue - 1}", style: TextStyle(fontSize:20,color: Colors.grey[600] ),),
                  SizedBox(width: 5,),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    elevation: 5,
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(108, 110, 245, 1)
                      ),
                      child: Swiper(
                  scrollDirection: Axis.horizontal,
                  onIndexChanged: (val){
                    setState(() {
                      _currentValue ++;
                  });
                  },
                  itemBuilder: (BuildContext context,int index){

                    return Center(child: Text("$_currentValue", style: TextStyle(fontSize:25, color: Colors.white, fontWeight: FontWeight.w500)));
                  },
                  itemCount: 10,
                  ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text("${_currentValue + 1}", style: TextStyle(fontSize:20,color: Colors.grey[600] ),),
                  SizedBox(width: 10,),
                  Text('${_currentValue + 2}', style: TextStyle(fontSize:15,color: Colors.grey[400] ),),
                  SizedBox(width: 10,),
                  Text('${_currentValue + 3}', style: TextStyle(fontSize:10,color: Colors.grey[200] ),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left:20),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:  roomlist.length,
                itemBuilder: (context, index){
                  return rooms(roomlist[index], context);
                }
                ),
            )
          
          ],
        )
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Column(children: [
          Divider(thickness: 1,)
        ],),
      ),
    );
  }

  Widget rooms(String name, context){
    return Container(
      width: MediaQuery.of(context).size.width/3 + 15,
      height: 100,
      margin: EdgeInsets.only(right:20),
      decoration: BoxDecoration(
        color:Color.fromRGBO(67,78,93, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.hotel, size: 50,color:Colors.black38),
          Padding(
            padding: const EdgeInsets.only(top:5.0, bottom: 15),
            child: Text(name, style: TextStyle(color: Colors.white, fontSize: 16,)),
          )
        ],
      ),
    );
  }

  Widget slider(context){
    return ClipPath(
        clipper: CustomRectClipper(),
          child: Container(
        height: MediaQuery.of(context).size.height * 3/5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey[200]
        ),
        child: Stack(
          children: [
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 3,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width/2 +70,
                  
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(67,78,93, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 3,
                child: Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width/2 + 110,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(67,78,93, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: low.length > 0 ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            option[low[0]][2],SizedBox(width: 10,),
                            Text(low[0], style: TextStyle(color: Colors.grey),),
                          ],
                        ): Text(""),
                      ),
                      Container(
                        // height:10,
                        padding: const EdgeInsets.only(bottom:8.0),
                        child: high.length > 0 ? 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            option[high[0]][2],SizedBox(width: 10,),
                            Text(high[0], style: TextStyle(color: Colors.grey),),
                          ],
                        ): Text(""),
                      )
                  ],),
                ),
              ),
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 20,
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width/2 + 140,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(67,78,93, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Swiper(
                    scrollDirection: Axis.vertical,
                    onIndexChanged: (val){
                      setState(() {
                        current  = options[val];
                        low = [];
                        for(var i = val-1; i>=0; i--){
                          low.add(options[i]);
                        }
                        high = [];
                        for(var i = val+1; i<=options.length-1; i++){
                          high.add(options[i]);
                        }
                      });
                    },
                    itemBuilder: (BuildContext context,int index){
                      
                        current = options[index];
                      
                      return Center(child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            option[options[index]][0],
                            SizedBox(width: 30,),
                            option[options[index]][1],
                          ],),
                          
                          Text(options[index], style: TextStyle(color: Colors.grey[300]),),
                        ],
                      ));
                    },
                    itemCount: options.length,
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  

}


class CustomRectClipper extends CustomClipper<Path>{
@override
 Path getClip(Size size) {
   Path path = new Path();
    path.lineTo(0,size.height);
    path.lineTo(size.width/2,size.height);
    path.quadraticBezierTo(size.width/2 + 20, size.height, size.width/2 + 45,size.height-15);
    path.quadraticBezierTo(size.width/2 + 70, size.height-30, size.width/2 + 110,size.height-15);
    path.quadraticBezierTo(size.width/2 + 135, size.height, size.width/2 + 145,size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
 }
 @override
 bool shouldReclip(CustomClipper<Path> oldClipper) {

 return false;
 }
}









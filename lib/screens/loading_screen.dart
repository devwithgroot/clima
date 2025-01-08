import 'package:flutter/material.dart';
import 'package:section_13/screens/location_screen.dart';
import 'package:section_13/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState(){
    super.initState();
    getLocationData();
  }



  void getLocationData() async {

    WeatherModel weatherModel=WeatherModel();
    var weatherData= await weatherModel.getLocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context)
    {
      return LocationScreen(locationWeather:weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
         child: SpinKitDoubleBounce(
           color: Colors.white,
           size: 50.0,
         ),
     ),
    );
  }
}


/*
If we want something to happen the moment stateful weiget is called the we write
it in       initState()

void initState(){
super.initState();
print('initStateCalled');
}


If we want something to happen every time stateful weiget is rebuilt
 then we write it in       build()      wo return wale part pe


 If we want something to destroy
 then we write it in       deactivate()

 @override
 void deactivate(){
 super.deactivate();
 printf(deactivate called);
 }

 */


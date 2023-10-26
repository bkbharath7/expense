import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class Signup extends StatelessWidget {
  Signup({super.key});



@override 
Widget build(BuildContext context) { 
	return Scaffold( 
	 

	body: ListView( 
		children: [ 
		CarouselSlider( children: [
		
 
				Container( 
			child: Image.asset("assets/Illustration1.png"),
				), 
				
			
				Container( 
				child: Image.asset("assets/Illustration2.png"),
				), 
				
			
				Container( 
		child: Image.asset("assets/Illustration3.png"),
				), 
				
			
		
    ]	

		), 
		], 
	), 

	); 
} 
}



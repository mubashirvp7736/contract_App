import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class Homesc extends StatefulWidget {
  const Homesc({super.key});

  @override
  State<Homesc> createState() => _HomescState();
}

class _HomescState extends State<Homesc> {
  int activeindex=0;
   final carsouelImage=[
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'
' https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'
    ];


   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
                    children: [
                      SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                        child: Row(
                         
                         children:[ 
                        IconButton(onPressed: (){}, icon: Icon(Icons.home),iconSize: 34,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcEbcDljO70-FQGiUXlZVKNfAKwuwk7qcirXCyGxKW&s'),),Text('sales'),SizedBox(width: 8,),
                             
                        CircleAvatar(backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY9GKV_0MDdEAJV9WFOXVd7gyG_8DvrRgqvA&usqp=CAU') ,),Text('Men'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHw7cFce2-ulLhCdmnSHN2lGifZnzVoZ-SwQ&usqp=CAU'),),Text('Women'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'),),Text('Kides'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'),),Text('jewellery'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'),),Text('footear'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU')),Text('beauty'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU')),Text('Home'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU')),Text('winterwear'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU'),),Text('accessorries'),SizedBox(width: 8,),
                        CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGj0_w5AHS5PIbhAMKL5ecNY5qAqRzWMW9sdkzNaR5QWzbX1Zu2FjcRPngpl3mlZMo5Mk&usqp=CAU')),Text('homegrownbrands'),SizedBox(width: 8,)
                        ]),
                      ),       
                      CarouselSlider.builder(itemCount: carsouelImage.length, itemBuilder: (context, index, realIndex) {
                        final imagepath = carsouelImage[index];
                        return Container(
                          child: Image(image: NetworkImage(imagepath))
                        );
                      },
                      options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeindex=index;
                          });
                        },

                      ))
                    ],
                  ),
        
              
              
            );
  }
}
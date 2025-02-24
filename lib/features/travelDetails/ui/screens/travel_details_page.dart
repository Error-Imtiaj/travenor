import 'package:flutter/material.dart';
import 'package:travenor/app/asset_path.dart';
import 'package:travenor/app/colors.dart';

class TravelDetailsPage extends StatefulWidget {
  const TravelDetailsPage({Key? key, required this.imagePath}) : super(key: key);
  final String? imagePath;
  static const String routeName = '/travel-details';
  @override
  State<TravelDetailsPage> createState() => _TravelDetailsPageState();
}

class _TravelDetailsPageState extends State<TravelDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              widget.imagePath ?? AssetPath.destinationImage1, // Replace with actual image URL
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          // Back & Favorite Buttons
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.bookmark_border, color: Colors.black),
            ),
          ),
          // Bottom Details Section
          Positioned(
            top: 370,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height - 370,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Niladri Reservoir',
                          ),
                          Text(
                            'Tekergat, Sunamganj',
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(AssetPath.userImage),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.abc, size: 14, color: Colors.grey),
                          SizedBox(width: 5),
                          Text('Tekergat',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 10),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text('4.7 (2498)',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('\$59/Person',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Gallery
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(
                  //       4,
                  //       (index) => Padding(
                  //         padding: EdgeInsets.only(right: 8.0),
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(12),
                  //           child: Image.network(
                  //             'https://your-thumbnail-url.com',
                  //             width: 60,
                  //             height: 60,
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Text(
                    'About Destination',
                  ),
                  SizedBox(height: 5),
                  Text(
                    'You will get a complete travel package on the beaches. Packages include airline tickets, recommended hotel rooms, and transportation.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:
                        Text('Read More', style: TextStyle(color: Colors.blue)),
                  ),

                  // Book Now Button\
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlueColor,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: Text('Book Now',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

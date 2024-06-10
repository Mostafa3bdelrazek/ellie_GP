// ignore_for_file: file_names
import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  bool ismale = true;
  double height = 120.0;
  int weight = 40, age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorManager.baseColor3,
              ),
              height: 150,
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Conversations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context,index)=>Container(
                height: 200,
                decoration: BoxDecoration(
                    color: const Color(0xff225FA7),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.purple,width: 2)
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Image.asset('assets/images/image.jpeg',fit: BoxFit.fill,)),
                    const SizedBox(height: 16,),
                    Text(
                      'New Conversations',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Colors.purple.shade800
                      ),
                    ),
                    const SizedBox(height: 16,),
                  ],
                ),
              ),
              separatorBuilder: (context,index)=>const SizedBox(width: 24,),
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}

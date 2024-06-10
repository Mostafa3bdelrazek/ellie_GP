import 'package:chart/core/presentation/resources/routes_manager.dart';
import 'package:chart/pages/drawer_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:chart/core/presentation/resources/font_manager.dart';
import 'package:chart/core/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>titles=[
      'Interactive Learning at Your Fingertips',
      'Your Learning Adventure Awaits!',
      'Unlock Your Learning Potential',
    ];
    List<String>subTitles=[
      'Learn with your AI friend! Get a personalized guide to make learning fun & easy.',
      "It's all about you! We'll adjust to your pace & interests for a perfect fit",
      "They help you develop a deeper understanding of concepts through interactive exercises and personalized feedback",
    ];
    return Scaffold(
      drawer:const DrawerScreen(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorManager.baseColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Mostafa 👋',

              style: getBoldInterStyle(
                color: ColorManager.baseColor,
                fontSize: FontSize.s24,
              ),
            ),
            const SizedBox(height: 24,),
            CarouselSlider(
              options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 10),
                  autoPlay: true,
                  //autoPlayAnimationDuration: const Duration(seconds: 60),
                  autoPlayCurve: Curves.slowMiddle,
                  enlargeCenterPage: true,
                  onPageChanged: ((index, reason) {
                    //cubit.activeIndicatorIndex(index);
                  })
              ),
              items:titles.map((e) =>Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: ColorManager.baseColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                                Image.asset(
                                  'assets/images/s1.png',
                                  fit: BoxFit.cover,
                                  height: 130,
                                ),
                                const SizedBox(width: 8,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18),
                              ),
                              const SizedBox(width: 16,),
                              Text(
                                subTitles[1],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.amber.shade300,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8,),
                      ],
                    ),
                  ),
                ],
              )).toList(),
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedSmoothIndicator(
                  activeIndex:1, //cubit.carouseIndex,
                  count:titles.length,// cubit.sliderImages.length,
                  effect: JumpingDotEffect(
                      dotWidth: 18,
                      dotHeight: 9,
                      dotColor: Colors.grey,
                      activeDotColor: ColorManager.baseColor,
                      jumpScale: 1.1
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Last Conversations',
                  style: getBoldInterStyle(
                    color: ColorManager.baseColor,
                    fontSize: FontSize.s18,
                  ),
                ),
                InkWell(
                onTap:(){
                  Navigator.pushNamed(context, Routes.allConversations);
                },
                  child: Container(
                    padding: const EdgeInsets.only(right: 8,left: 8),
                    decoration: BoxDecoration(
                      color: ColorManager.baseColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Text(
                      'see more',
                      style: getMediumInterStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (contest,index)=>Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(

                        child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/image.jpeg',
                            fit: BoxFit.fill,
                            height: 200,
                            width: 180,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Text(
                        'Conversations',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldInterStyle(
                          color: ColorManager.black,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        '21-11-2001 12:30 MP',
                        style: getBoldInterStyle(
                          color: ColorManager.greLight,
                          //fontSize: FontSize.s18,
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (contest,index)=>const SizedBox(width: 16,),
                  itemCount: 4,),
            ),

            Divider(color: ColorManager.baseColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24,),
                      Text("Ready to unlock your potential? Let's learn!",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldInterStyle(
                          color: ColorManager.baseColor,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      const SizedBox(height: 24,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.avatarRoute);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                          decoration: BoxDecoration(
                            color: ColorManager.baseColor,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            'New Conversation 💬',
                            style: getBoldInterStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/avater1.png',
                  height: 200,
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

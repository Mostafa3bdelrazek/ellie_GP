import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PhotoSlider extends StatefulWidget {
  final List<String> imagePaths; // Or use a list of ImageProviders

  const PhotoSlider({Key? key, required this.imagePaths}) : super(key: key);

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  // ignore: unused_field
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imagePaths.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Image(
              image: AssetImage(
                  imagePath), // Or use NetworkImage for network sources
              fit: BoxFit.cover, // Adjust as needed
              errorBuilder: (context, error, stackTrace) => const Center(
                  child: Text('Error loading image')), // Error handling
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        enableInfiniteScroll: true, // Optional for infinite looping
        autoPlay: true, // Optional for autoplay
        autoPlayInterval:
            const Duration(seconds: 3), // Adjust autoplay delay if used
        autoPlayAnimationDuration:
            const Duration(milliseconds: 800), // Adjust transition duration
        onPageChanged: (index, reason) =>
            setState(() => _currentImageIndex = index),
      ),
    );
  }
}

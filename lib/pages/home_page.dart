import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    "https://dimg04.c-ctrip.com/images/20050a0000004j51s05F5_C_190_150_Q50.jpg_.webp?v=1",
    "https://dimg04.c-ctrip.com/images/200l0e0000006z88r435A_C_190_150_Q50.jpg_.webp?v=1",
    "https://dimg04.c-ctrip.com/images/200r0a0000004j4go7DD0_C_190_150_Q50.jpg_.webp?v=1"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 160,
              child: Swiper(
                autoplay: true,
                pagination: SwiperPagination(),
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    _imageUrls[index],
                    fit: BoxFit.fill,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

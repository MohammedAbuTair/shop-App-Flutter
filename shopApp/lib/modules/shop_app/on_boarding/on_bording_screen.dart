import 'package:flutter/material.dart';
import 'package:shop_app/modules/shop_app/login/login_screen.dart';
import 'package:shop_app/shared/compontents/compontents.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoradingModel {
  final String image;
  final String title;
  final String body;
  BoradingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoradingScreen extends StatefulWidget {
  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  var borderControler = PageController();

  List<BoradingModel> bording = [
    BoradingModel(
        image: 'assets/images/onboard_1.jpg',
        title: "Select Shop 1",
        body: 'Select what you want 1'),
    BoradingModel(
        image: 'assets/images/onboard_2.jpg',
        title: "Select Shop 2",
        body: 'Select what you want 2'),
    BoradingModel(
        image: 'assets/images/onboard_3.jpg',
        title: "Select Shop 3",
        body: 'Select what you want 3'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
            label: "skip",
            function: navagetAndFinish(
              context,
              LoginScreen(),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == bording.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: borderControler,
              itemBuilder: (context, index) =>
                  buildBoardingItems(bording[index]),
              itemCount: bording.length,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: borderControler,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColors,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5),
                count: bording.length,
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    navagetAndFinish(
                      context,
                      LoginScreen(),
                    );
                  } else {
                    borderControler.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget buildBoardingItems(BoradingModel model) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Image(
          image: AssetImage('${model.image}'),
          // fit: BoxFit.cover,
        )),
        Text(
          '${model.title}',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${model.body}',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ]);
}

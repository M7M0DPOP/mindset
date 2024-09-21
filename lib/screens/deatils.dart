import 'package:final_project/model/product_deatils.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/show_review.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

int indexG = 0;

class Details extends StatelessWidget {
  Details({super.key, required this.index});
  final int index;

  final List<ProuductDeatils> prouduct = [
    ProuductDeatils(
        'assets/images/i.png',
        99,
        'Nike Club Fleece',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'assets/images/Rectangle575.png',
        'assets/images/Rectangle576.png',
        'assets/images/Rectangle577.png',
        'assets/images/Rectangle578.png'),
    ProuductDeatils(
        'assets/images/Rectangle3.png',
        99,
        'Trail Running Jacket Nike Windrunner',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'assets/images/Rectangle575.png',
        'assets/images/Rectangle576.png',
        'assets/images/Rectangle577.png',
        'assets/images/Rectangle578.png'),
    ProuductDeatils(
        'assets/images/Rectangle2.png',
        130,
        'Trail Running Jacket Nike Windrunner',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'assets/images/Rectangle575.png',
        'assets/images/Rectangle576.png',
        'assets/images/Rectangle577.png',
        'assets/images/Rectangle578.png'),
    ProuductDeatils(
        'assets/images/Rectangle569.png',
        150,
        'Trail Running Jacket Nike Windrunner',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..',
        'assets/images/Rectangle575.png',
        'assets/images/Rectangle576.png',
        'assets/images/Rectangle577.png',
        'assets/images/Rectangle578.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          // Stack للصورة والعناصر التي توضع فوقها
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage())); // وظيفة الزر
                      },
                      icon: const HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowLeft02,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      label: const Text(''),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  // الصورة في الخلفية
                  SizedBox(
                    height: 400,
                    width: 220,
                    child: Image.asset(
                      prouduct[index].image,
                    ),
                  ),
                  // الزر في أعلى يسار الصورة

                  // الأيقونة في أعلى يمين الصورة

                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 6),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedLockPassword,
                      color: Colors.black,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // العناصر أسفل الـ Stack
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Men\'s Printed Pullover Hoodie',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          Text(
                            prouduct[0].name,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Price',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey)),
                          Text(
                            '\$${prouduct[index].price}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(prouduct[0].part1),
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(prouduct[index].part2),
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(prouduct[index].part3),
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(prouduct[index].part4),
                            ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('Size Guide',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'X',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'M',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'L',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'XL',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            '2XL',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text('Description',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                  Text(
                    prouduct[index].describtion,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          indexG = index;
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const ReviewStreamBuilder();
                          }));
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  reviewWidgets.length == 0
                      ? const RewiewShape(
                          username: '',
                          rate: '',
                          time: '',
                          reviewDiscrep: '',
                        )
                      : RewiewShape(
                          username:
                              reviewWidgets[reviewWidgets.length - 1].username,
                          reviewDiscrep: reviewWidgets[reviewWidgets.length - 1]
                              .reviewDiscrep,
                          rate: reviewWidgets[reviewWidgets.length - 1].rate,
                          time: reviewWidgets[reviewWidgets.length - 1].time,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'with VAT,SD',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '\$${prouduct[index].price + 5}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color(0xFF9775FA)), // Set background color
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .zero, // No border radius for a rectangular shape
                            side: BorderSide(
                                color: Colors.transparent,
                                width: 2), // Border color and width
                          ),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color(0xFF9775FA)), // Set background color
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .zero, // No border radius for a rectangular shape
                            side: BorderSide(
                                color: Colors.transparent,
                                width: 2), // Border color and width
                          ),
                        ),
                      ),
                      child: const Text(
                        'Buy',
                        style: TextStyle(color: Colors.white),
                      ),
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

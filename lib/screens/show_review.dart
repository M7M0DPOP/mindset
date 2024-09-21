import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/screens/add_review.dart';
import 'package:final_project/screens/deatils.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/wishlist.dart';
import 'package:flutter/material.dart';

List<RewiewShape> reviewWidgets = [];

class ReviewStreamBuilder extends StatefulWidget {
  const ReviewStreamBuilder({super.key});

  @override
  State<ReviewStreamBuilder> createState() => _ReviewStreamBuilderState();
}

class _ReviewStreamBuilderState extends State<ReviewStreamBuilder> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WishlistScreen()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ReviewStreamBuilder()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Text('Home')
                : const Icon(Icons.home, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Text('Wishlist')
                  : const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Text('My Reviews')
                  : const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              label: ''),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? const Text('My Numbers')
                  : const Icon(Icons.wallet, color: Colors.grey),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Add back functionality here
          },
        ),
        title: const Text('Reviews'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${reviewWidgets.length} Reviews',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Text(' 4.8'),
                      ],
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => AddReviewScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Review'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestor.collection('review').orderBy('time').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black38),
                  );
                }
                reviewWidgets.clear();
                final reviews = snapshot.data!.docs.reversed;
                for (var review in reviews) {
                  final reviewusername = review.get('username');
                  final reviewdiscrep = review.get('review');
                  final reviewrate = review.get('rate');
                  final reviewtime = review.get('sendtime');
                  final messageWidget = RewiewShape(
                    username: reviewusername,
                    reviewDiscrep: reviewdiscrep,
                    rate: reviewrate,
                    time: reviewtime.toString(),
                  );

                  reviewWidgets.add(messageWidget);
                }
                return ListView(
                  children: reviewWidgets,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

var firestor = FirebaseFirestore.instance;

class RewiewShape extends StatelessWidget {
  final String username;
  final String rate;
  final String reviewDiscrep;
  final String time;

  const RewiewShape({
    super.key,
    required this.username,
    required this.reviewDiscrep,
    required this.rate,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/i.png'), // User image URL from Firestore if available
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Text(rate,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                    ],
                  ),
                  const Text('rating', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            reviewDiscrep,
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 14),
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReviewStreamBuilder extends StatelessWidget {
  const ReviewStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestor.collection('review').snapshots(),
        builder: (context, snapshot) {
          List<RewiewShape> reviewWidgets = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black38,
              ),
            );
          }
          final reviews = snapshot.data!.docs.reversed;
          for (var review in reviews) {
            final reviewusername = review.get('username');
            final reviewdiscrep = review.get('review');
            final reviewrate = review.get('rate');
            final reviewtime = review.get('time');
            final messageWidget = RewiewShape(
              username: reviewusername,
              reviewDiscrep: reviewdiscrep,
              rate: reviewrate,
              time: reviewtime,
            );
            reviewWidgets.add(messageWidget);
          }
          return ListView(
            reverse: true,
            children: reviewWidgets,
          );
        });
  }
}

class RewiewShape extends StatelessWidget {
  final String username;
  final String rate;
  final String reviewDiscrep;
  final String time;

  const RewiewShape({
    super.key,
    required this.username,
    required this.reviewDiscrep,
    required this.rate,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                '',
                width: 40,
                height: 40,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text('$username'), Text('$time')],
              ),
              Text('${rate}'),
              Text('rating')
            ],
          ),
          Text(
            '$reviewDiscrep',
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}

var firestor = FirebaseFirestore.instance;*/

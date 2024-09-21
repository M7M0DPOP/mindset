import 'package:final_project/screens/deatils.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/show_review.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedIndex = 1;

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
            context, MaterialPageRoute(builder: (context) => WishlistScreen()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: const Icon(Icons.menu, color: Colors.black),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined,
                    color: Colors.black),
                onPressed: () {},
              ),
            ],
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .5,
                    ),
                    itemCount: wishList.length,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                        child: ProductCard(product: wishList[index]),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(index: index)));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
                      : const Icon(Icons.shopping_bag_outlined,
                          color: Colors.grey),
                  label: ''),
              BottomNavigationBarItem(
                  icon: _selectedIndex == 3
                      ? const Text('My Wallet')
                      : const Icon(Icons.wallet, color: Colors.grey),
                  label: ''),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
}

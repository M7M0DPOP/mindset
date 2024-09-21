import 'package:final_project/screens/deatils.dart';
import 'package:final_project/screens/show_review.dart';
import 'package:final_project/screens/wishlist.dart';

import 'package:flutter/material.dart';

final List<Map<String, String>> brands = [
  {
    'name': 'Adidas',
    'logo':
        'https://seeklogo.com/images/A/adidas-logo-107B082DA0-seeklogo.com.png'
  },
  {
    'name': 'Nike',
    'logo':
        'https://seeklogo.com/images/N/nike-logo-47A65A59D5-seeklogo.com.png'
  },
  {
    'name': 'Fila',
    'logo':
        'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/0002/3255/brand.gif?itok=c7RQmTgC'
  },
  {
    'name': 'Puma',
    'logo':
        'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/122022/puma.jpg?9AJaVFSeNNTxbQpeU2O2n8Hc.OLCnaHe&itok=gASMDWAS'
  },
];

final List<Product> products = [
  Product('Nike Sportswear Club Fleece', 99, 'assets/images/Rectangle568.png',
      false),
  Product('Trail Running Jacket Nike Windrunner', 99,
      'assets/images/Rectangle3.png', false),
  Product('Adidas Training Shirt', 80, 'assets/images/Rectangle2.png', false),
  Product('Puma Windbreake r', 90, 'assets/images/Rectangle569.png', false),
];

List<Product> wishList = [];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(Icons.menu, color: Colors.black),
          actions: [
            IconButton(
              icon:
                  const Icon(Icons.shopping_bag_outlined, color: Colors.black),
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
              const Text('Hello',
                  style: TextStyle(color: Colors.black, fontSize: 28)),
              const Text(
                'Welcome to Laza.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.mic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose Brand',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('View All', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: brands.map((brand) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        avatar: CircleAvatar(
                          child: Image.network(brand['logo'] ?? ''),
                        ),
                        label: Text(brand['name'] ?? ''),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('New Arrival',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('View All', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .5,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                        index: index,
                                      )));
                        },
                        child: ProductCard(product: products[index]));
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
                    ? const Text('My Numbers')
                    : const Icon(Icons.wallet, color: Colors.grey),
                label: ''),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;
  // final description
  bool isLiked;
  Product(this.name, this.price, this.image, this.isLiked);
}

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                width: 160,
                height: 190,
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${widget.product.price}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(
                      widget.product.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.product.isLiked ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.product.isLiked = !widget.product.isLiked;
                        if (widget.product.isLiked) {
                          wishList.add(widget.product);
                        } else {
                          wishList.removeAt(wishList.indexOf(widget.product));
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

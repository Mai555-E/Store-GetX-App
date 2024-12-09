import 'package:flutter/material.dart';
import '../../../resources/app_assets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  static const List<String> sizeSelection = ["S", "M", "L", "XL", "XXL", "XXXL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Beige Container
          Flexible(
            flex: 2,
            child: Container(
              color: const Color(0xffeee5db),
              padding: const EdgeInsets.fromLTRB(13, 10, 13, 0),
              child: Column(
                children: [
                  // Title with Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 25,
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        style: IconButton.styleFrom(backgroundColor: Colors.white),
                      ),
                      const Text("Product Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                      IconButton(
                        onPressed: () {},
                        iconSize: 25,
                        style: IconButton.styleFrom(backgroundColor: Colors.white),
                        icon: const Icon(Icons.favorite_border_rounded, color: Colors.black),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(height: 190, child: Image.asset(AppAssets.girlJacketImage, width: 135, fit: BoxFit.fill))
                ],
              ),
            ),
          ),

          // White container
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Female's style", style: TextStyle(color: Colors.grey[600])), const Text("\u{2B50} 4.5")],
                  ),
                  const Spacer(),
                  const Text("Light Brown Jacket", style: TextStyle(fontSize: 20, color: Color(0xff1F2029), fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Text("Product Details", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    "Perfect for layering over your favorite shirt or sweater, this jacket transitions effortlessly from day to night, making it a versatile addition to any wardrobe.",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const Spacer(),
                  const Divider(),
                  const Spacer(),
                  const Text("Select Size", style: TextStyle(fontSize: 17, color: Color(0xff1F2029), fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [for (String size in sizeSelection) SelectSize(size)]),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: "Select Color",
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
                      children: [TextSpan(text: " : Brown", style: TextStyle(color: Colors.grey[700], fontSize: 18))],
                    ),
                  ),
                  const Spacer(flex: 5)
                ],
              ),
            ),
          ),

          // Bottom Sheet container
          Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 5, offset: Offset(0, 3), color: Color.fromRGBO(0, 0, 0, .3))],
            ),
            child: Row(
              children: [
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total Price", style: TextStyle(color: Colors.grey[700], fontSize: 17)),
                    const Text("\$83.79", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800))
                  ],
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: ElevatedButton.icon(onPressed: () {}, label: const Text("Add to cart"), icon: const Icon(Icons.shopping_bag_rounded)),
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SelectSize extends StatelessWidget {
  final String size;
  const SelectSize(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(), color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Text(size, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)));
  }
}

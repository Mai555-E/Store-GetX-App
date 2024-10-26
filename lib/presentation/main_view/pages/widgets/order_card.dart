import 'package:flutter/material.dart';

import '../../../../domain/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 90,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle, color: Color(0xffeee5db), borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Image.asset(order.product.image),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.product.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                    Text(order.product.size, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                    Text("\$${order.product.price}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
                  ],
                ),
                
                   Row(
                  children: [
                    
                     _buildCounterCartButton(isRemoveIcon: true),
                    const SizedBox(width: 5),
                    Text(order.quantity.toString(), style: const TextStyle(fontSize: 17)),
                    const SizedBox(width: 5),
                    _buildCounterCartButton(isRemoveIcon: false)

                  ],
                ),
                
                
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCounterCartButton({required bool isRemoveIcon}) {
    return SizedBox.square(
      dimension: 30,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: isRemoveIcon ? const Color(0xffededed) : const Color(0xff704f38),
        ),
        child: Icon(isRemoveIcon ? Icons.remove : Icons.add, size: 20, color: isRemoveIcon ? Colors.black : Colors.white),
      ),
    );
  }
}

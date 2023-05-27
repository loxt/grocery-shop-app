import 'package:flutter/material.dart';
import 'package:grocery_shop_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "My Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItems.length,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        ShopItem cartItem = value.cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: ListTile(
                                leading: Image.asset(
                                  cartItem.imagePath,
                                  height: 36,
                                ),
                                title: Text(cartItem.name),
                                subtitle: Text("\$${cartItem.price}"),
                                trailing: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItemFromCart(index),
                                ),
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              " Total Price",
                              style: TextStyle(
                                  color: Colors.green[100],
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "\$${value.calculateTotal()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green.shade100),
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.all(12),
                          child: const Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}

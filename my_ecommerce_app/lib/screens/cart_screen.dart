import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the cart. We want to listen (default) so this screen rebuilds when we remove an item.
    final cart = Provider.of<CartProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Shopping Cart'),
      ),
      body: Column(
        children: [
          // The list of items
          Expanded(
            // If cart is empty, show a message
            child: cart.items.isEmpty
                ? const Center(child: Text('Your cart is empty. Add some Comics & Manga!'))
                : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cart.items[index];

                // A ListTile to show item details
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.primaryColor,
                    // ERROR FIX: Replaced cartItem.name[0] with cartItem.title[0]
                    child: Text(cartItem.title[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  // ERROR FIX: Replaced cartItem.name with cartItem.title
                  title: Text(cartItem.title),
                  subtitle: Text('Qty: ${cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Total for this item
                      Text(
                        '₱${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Remove button
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          // Call the removeItem function
                          cart.removeItem(cartItem.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Total Price Summary
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₱${cart.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: theme.primaryColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
import 'dart:developer';
import 'package:Delivery_App/fastfood/CartScreen/cart_tile.dart';
import 'package:Delivery_App/fastfood/CartScreen/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart',style: TextStyle(color: Colors.pink),),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: PersistentShoppingCart().showCartItems(
                  cartTileWidget: ({required data}) => CartTileWidget(data: data),
                  showEmptyCartMsgWidget: const EmptyCartMsgWidget(),
                ),
              ),
              PersistentShoppingCart().showTotalAmountWidget(
                cartTotalAmountWidgetBuilder: (totalAmount) =>
                    Visibility(
                      visible: totalAmount == 0.0 ? false: true,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total', style: TextStyle(color: Colors.white , fontSize: 22),),
                              Text(r"$"+totalAmount.toString(), style: const TextStyle(color: Colors.white , fontSize: 22),),
                            ],
                          ),
                          ElevatedButton(onPressed: (){
        
                            final shoppingCart = PersistentShoppingCart();
      
                            Map<String, dynamic> cartData = shoppingCart.getCartData();
        
                            // ignore: unused_local_variable
                            List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];
                            double totalPrice = cartData['totalPrice'];
        
                            log('Total Price: $totalPrice');
        
                          }, child: const Text('Checkout'))
                        ],
                      ),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

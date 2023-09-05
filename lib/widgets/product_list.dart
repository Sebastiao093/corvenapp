import 'package:corven_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Product> productsList = [Product(id: 1, image: 'amortiguador', title: 'amortiguador', price: 10000, stock: true), Product(id: 2, image: 'amortiguador2', title: 'amortiguador 2', price: 5000, stock: false), Product(id: 3, image: 'portamangueta', title: 'portamangueta', price: 1000, stock: true), Product(id: 4, image: 'portamangueta', title: 'portamangueta', price: 1000, stock: true), Product(id: 5, image: 'amortiguador', title: 'amortiguador', price: 10000, stock: true), Product(id: 6, image: 'amortiguador2', title: 'amortiguador 2', price: 5000, stock: false)];


    return /* Container(); */ ListView.builder(
      itemCount: productsList.length,
      itemBuilder: (_, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'details'),
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 140,
                            width: 140,
                            color: Colors.white,
                            child: FadeInImage(
                              fit: BoxFit.contain,
                              placeholder: AssetImage('assets/no-image.png'),
                              image: AssetImage('assets/${productsList[index].image}.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width - 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productsList[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              productsList[index].price.toString() + ' \$' ,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              color: productsList[index].stock ? Colors.green : Colors.red,
                              child: Text(
                                productsList[index].stock ? 'Stock' : 'No Stock',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}

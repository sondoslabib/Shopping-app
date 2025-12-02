import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/feature/home/domain/entities/product_entity.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamed(ProductDetailsScreen.routeName, arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Stack(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: product.images?[0] ?? imageTest,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: double.infinity,
                  height: 220,

                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: SvgPicture.asset(
                  'assets/icons/icon-favourite.svg',
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            product.title ?? "T-shirt oversize",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "EGP ${product.price}",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

const String imageTest = 'https://i.imgur.com/QkIa5tT.jpeg';

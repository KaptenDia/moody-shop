import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moody_shop/core.dart';

class ProductDetailView extends StatefulWidget {
  final Map item;
  const ProductDetailView({Key? key, required this.item}) : super(key: key);

  Widget build(context, ProductDetailController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: blackColor.withOpacity(0.4),
            child: BackButton(
              color: whiteColor,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: whiteColor,
              child: const Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Wishlist',
                width: Get.width,
                backgroundColor: whiteColor,
                onTap: () {},
                enableTrailing: false,
                textColor: blackColor,
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: CustomButton(
                text: 'Add to Cart',
                width: Get.width,
                backgroundColor: blackColor,
                onTap: () {},
                enableTrailing: false,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item['photo'],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item["product_name"],
                        style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$${item["price"]}',
                        style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item["category"],
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 20.0,
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const Spacer(),
                      Text(
                        'Reviews',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Description',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vulputate varius ipsum, nec scelerisque lorem dignissim a. Phasellus suscipit vehicula purus vitae mollis. Phasellus sed eleifend metus, et malesuada mauris. Fusce ultricies metus vitae consequat eleifend. Mauris enim sapien, tempor sed egestas id, volutpat ac ipsum. In id interdum lorem. Vestibulum tristique ac risus non vehicula. Vivamus vel magna porta, malesuada enim eget, congue orci. Maecenas vitae fringilla augue, non condimentum quam. Vestibulum mattis sit amet erat id consequat. Mauris ac nunc eu lorem tristique placerat. Phasellus consequat at lectus quis efficitur.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProductDetailView> createState() => ProductDetailController();
}

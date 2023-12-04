import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String? title;
  final num? productPrice;
  final String? productImage;
  final String? productDescription;

  const ProductDetailScreen({
    required this.title,
    required this.productImage,
    required this.productPrice,
     this.productDescription,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    //     appBar: AppBar(
    //     leading: IconButton(
    //     icon: Icon(Icons.arrow_back),
    // onPressed: () {
    // Navigator.of(context).pop();
    // },
    //     ),
    //     ),
        body: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 1,
          childAspectRatio: 5/4,
          padding: EdgeInsets.all(10.0),
          children: [

            Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    // child: Stack(
                    //   children: [
                        child:Image.network(
                          widget.productImage ?? '',
                          fit: BoxFit.cover,
                        ),



                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,

                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: (){

                        }, icon: Icon(Icons.favorite,color: Colors.white,),
                      ),
                    ),
                  ),


                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,

                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();

                        }, icon: Center(child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      ),
                    ),
                  ),


                ),
              ],
            ),
            // Container(
            //   height: 400,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     border: Border.all(
            //       color: Colors.grey,
            //       width: 2.0,
            //     ),
            //   ),
            //   child: Center(
            //     child: Stack(
            //       children: [
            //         Image.network(
            //           widget.productImage ?? '',
            //           fit: BoxFit.cover,
            //         ),
            //         Positioned(
            //           top: 8,
            //           left: 8,
            //           child: Container(
            //             height: 40,
            //             width: 30,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.green,
            //
            //             ),
            //             child: Center(
            //               child: IconButton(
            //                 onPressed: (){
            //                   Navigator.of(context).pop();
            //
            //                 }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Spacer(),
            //         Positioned(
            //           top: 8,
            //           right: 8,
            //           child: Container(
            //             height: 40,
            //             width: 40,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(5),
            //               color: Colors.green,
            //
            //             ),
            //             child: Center(
            //               child: IconButton(
            //                 onPressed: (){
            //
            //                 }, icon: Icon(Icons.favorite,color: Colors.white,),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Column(
              children: [

                Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '\$${widget.productPrice?.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Text(
                        'Description:\n ${widget.productDescription ?? ''}',
                        style: const TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: const Text('Add to Cart'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

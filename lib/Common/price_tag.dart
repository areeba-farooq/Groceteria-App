import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: FittedBox(
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '\$1.69',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 128, 6)),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '\$2.59',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

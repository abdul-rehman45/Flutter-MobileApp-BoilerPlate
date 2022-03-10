import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class CartQtyCounter extends StatefulWidget {
  CartQtyCounter({Key? key, this.quatity = 1, this.outStock = false})
      : super(key: key);
  int quatity = 1;
  bool outStock = false;

  @override
  State<CartQtyCounter> createState() => _CartQtyCounterState();
}

class _CartQtyCounterState extends State<CartQtyCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.remove,
                size: 16,
                color: widget.quatity > 1
                    ? AppColors.textColor
                    : AppColors.grey.withOpacity(widget.outStock ? 0.25 : 0.5),
              ),
            ),
            onTap: () {
              if (widget.quatity > 1) {
                setState(() {
                  widget.quatity--;
                });
              }
            },
          ),
          Text(
            "${widget.quatity}",
            style: Utilities.setTextStyle(
              14,
              fontWeight: FontWeight.w600,
              color: widget.outStock
                  ? AppColors.textColor.withOpacity(0.5)
                  : AppColors.textColor,
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.add,
                size: 16,
                color: widget.outStock
                    ? AppColors.textColor.withOpacity(0.5)
                    : AppColors.textColor,
              ),
            ),
            onTap: () {
              setState(() {
                widget.quatity++;
              });
            },
          ),
        ],
      ),
    );
  }
}

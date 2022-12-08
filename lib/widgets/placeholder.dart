import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../backend/controllers/home_controller.dart';
import 'show_transaction_list.dart';

class PlaceholderInfo extends StatelessWidget {
  const PlaceholderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Get.find<HomeController>().myTransactions.isEmpty
          ? Center(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Database1.png',
                      filterQuality: FilterQuality.high,
                      height: 180.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'You have not added an income or expense today!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Add new incomes or expense to track your money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ShowTransactions(),
    );
  }
}

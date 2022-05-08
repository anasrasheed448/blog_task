
  import 'package:blog_task/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

buildHeader(user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: Get.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius:  BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        NetworkImage(user.picture.thumbnail.toString()),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.name.first.toString(),
                    style: TextStyle(
                        color: primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(text,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: primary)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:  BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12, bottom: 0, top: 5),
              child: Text(
                title,
                style: TextStyle(
                    color: primary, fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            // Divider(color: Colors.grey.shade300,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                value,
                style: TextStyle(
                    color: primary, fontWeight: FontWeight.w300, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

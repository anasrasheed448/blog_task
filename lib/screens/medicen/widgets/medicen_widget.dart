
  import 'package:blog_task/constants/style.dart';
import 'package:blog_task/models/local.dart';
import 'package:flutter/material.dart';

Padding buildListTile(AssociatedDrug sClient) {
    return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4),
                  child: Container(
                    width: 170,
                    decoration: BoxDecoration(
                      //  color: ,.
                      border: Border.all(color: Colors.black12),
                      borderRadius: const BorderRadius.all(
                         Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                child: Container(
                                  // height: double.maxFinite,
                  
                                  color: Colors.grey.shade300,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    radius: 40,
                                    child: Center(
                                      child: Text(
                                        sClient.name
                                            .substring(0, 1)
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: lightBlack,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        sClient.name.toUpperCase(),
                                        style: TextStyle(
                                            color: primary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Icon(
                                      //   Icons.chat,
                                      //   color: Theme.of(context).buttonColor,
                                      //   size: 15,
                                      // )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${sClient.dose}\n${sClient.strength}",
                                    style: TextStyle(
                                        color: lightBlack,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
  }
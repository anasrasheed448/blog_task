  import 'package:blog_task/constants/style.dart';
import 'package:blog_task/controllers/drink_controller.dart';
import 'package:blog_task/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Expanded buildListView(DrinkController localData) {
    return Expanded(
      child: Obx(() => ListView.builder(
          shrinkWrap: true,
          itemCount: localData.list.value.length, //client.list.value.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            Drinks drink = localData.list.value[index];
            return buildListTile(drink);
          })),
    );
  }

  Padding buildListTile(Drinks drink) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: GestureDetector(
              onTap: () {
              },
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
                                backgroundImage:
                                    NetworkImage(drink.strDrinkThumb!),
                                radius: 40,
                                child: Center(
                                  child: Text(
                                    drink.strDrink!
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    drink.strDrink!.toUpperCase(),
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
                                "${drink.strCategory}\n${drink.strGlass}",
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
            ),
          );
  }

  TextField searchField(DrinkController localData,_searchController) {
    return TextField(
      controller: _searchController,
      onChanged: (v) => localData.search(v),
      //   style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          hintText: "Search for Drink",
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,

            //color: Theme.of(context).buttonColor,
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            // color: Theme.of(context).backgroundColor
          )),
    );
  }

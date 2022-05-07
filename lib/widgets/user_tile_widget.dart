// import 'package:coaching_ms/constants/style.dart';
// import 'package:flutter/material.dart';

// class UserTileWidget extends StatelessWidget {
//   final String name;
//   final bool selected;
//   final Function onTap;
//   const UserTileWidget({Key key, this.name, this.selected = false, this.onTap})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       selected: selected,
//       selectedTileColor: primary.withOpacity(.2),
//       onTap: onTap,
//       leading: CircleAvatar(
//         backgroundColor: primary.withOpacity(.6),
//         radius: 30,
//         child: Icon(Icons.person),
//       ),
//       title: Text(
//         "$name",
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//       ),
//       subtitle: Padding(
//         padding: const EdgeInsets.only(left: 10, top: 3),
        
//       ),
//       trailing: selected
//           ? Icon(
//               Icons.check_box_rounded,
//               color: primary.withOpacity(.6),
//             )
//           : null
//     );
//   }
// }

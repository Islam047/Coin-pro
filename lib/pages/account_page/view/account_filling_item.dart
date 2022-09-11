import 'package:flutter/material.dart';

import '../account_provider.dart';
//
// Widget eachButton(TextEditingController controller, String name,
//     String hintText, AccountProvider provider,
//     {bool isPhoneNumber = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         name,
//         style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
//       ),
//       TextField(
//         enabled: provider.isEdit,
//         keyboardType:
//             isPhoneNumber ? TextInputType.phone : TextInputType.emailAddress,
//         textInputAction: TextInputAction.next,
//         controller: controller,
//         decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: TextStyle(color: Colors.grey.shade400)),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//     ],
//   );
// }

class EachButton extends StatelessWidget {
 final String hintText;
 final AccountProvider provider;
 final TextEditingController controller;
 final String name;
 bool? isPhoneNumber;

    EachButton({Key? key, required this.hintText, required this.provider, required this.controller, required this.name, this.isPhoneNumber = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        TextField(
          enabled: provider.isEdit,
          keyboardType:
          isPhoneNumber! ? TextInputType.phone : TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade400)),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

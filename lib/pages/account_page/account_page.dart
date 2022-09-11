import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_trading/pages/account_page/view/account_filling_item.dart';

import 'account_provider.dart';


class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ChangeNotifierProvider<AccountProvider>(
          create: (BuildContext context) => AccountProvider(),
          builder: (context, child) {
            return Consumer<AccountProvider>(
              builder: (context, model, child) {
                context.read<AccountProvider>().readAllData();
                context.read<AccountProvider>().readImage();
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width,

                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: model.saveAllUser,
                                icon: Icon(
                                  model.isEdit ? Icons.done : null,
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                                height: 150,
                                width: 150,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: model.readImage()),
                            Positioned(
                              bottom: 1,
                              right: 0,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.red,
                                child: IconButton(
                                  padding: const EdgeInsets.all(10),
                                  icon: const Icon(Icons.camera_alt_rounded),
                                  onPressed: () => model.getImage(context),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Personal Information",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child: IconButton(
                                    onPressed: () {
                                      model.editMethod();
                                    },
                                    icon: model.isEdit
                                        ? const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Icons.settings,
                                            color: Colors.white,
                                          ),),)
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        EachButton(hintText: 'Name', provider: model, controller:  model.nameController, name:  "Enter your name",)
                       , EachButton(hintText:     "Email", provider: model, controller:  model.emailController, name:   "Enter your email",)
                       , EachButton(hintText:"Mobile Number", provider: model, controller:  model.mobileController, name:   "Enter your number",isPhoneNumber: true,)

                      ],
                    )
                  ],
                ),
              ),
            );
  },
);
          },
        ),
      ),
    );
  }


}

import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              margin: const EdgeInsets.only(bottom: 40),
              padding:
              const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "Welcome to",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300)),
                            TextSpan(
                                text: '\nCoinPro',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 35))
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "My balance",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300)),
                            TextSpan(
                                text: '\n\$ 69.32.59',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff08eb8c),
                    child: const Text(
                      "Deposit INR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.black,
                    child: const Text(
                      "Withdraw INR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

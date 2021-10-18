import 'package:capturestarmonitoring/constants/app_themes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 28, top: 60, right: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Home 제목
                  const Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.titleColor,
                        fontFamily: 'Roboto'),
                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset: const Offset(0.2, 5),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('고덕 - 아파트 BIPV'),
                            Text('해동엔지니어링 님'),
                          ],
                        ),
                      ),
                  ),

                  const SizedBox(height: 28,),

                  const Text(
                    '발전현황',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppThemes.titleColor,
                        fontFamily: 'Roboto'),
                  ),

                  const SizedBox(height: 28,),

                  Container(
                    height: 320,
                    color: Colors.black54,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

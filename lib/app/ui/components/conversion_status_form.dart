import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConversionStatusForm extends StatelessWidget {
  const ConversionStatusForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6, crossAxisCount: 5, mainAxisSpacing: 5),
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0.2,
                            blurRadius: 5,
                            offset: const Offset(0.2, 5),
                          ),
                        ],
                      ),
                      child: GridTile(
                        header: Container(
                          decoration: const BoxDecoration(
                            color: AppThemes.blue10,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                          ),
                          height: 30,
                          child: GridTileBar(
                            leading: SvgPicture.asset(
                              'assets/images/check.svg',
                              width: 10,
                              height: 10,
                              fit: BoxFit.scaleDown,
                            ),
                            subtitle: const AutoSizeText(
                                '정상',
                                maxLines: 1,
                                maxFontSize: double.infinity,
                                minFontSize: 12.0,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // 수정 필요
                                const Text('98.2'),
                                SvgPicture.asset(
                                  'assets/images/battery.svg',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.scaleDown,
                                ),
                                const Text('Array1')
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:capturestarmonitoring/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components.dart';

// 일사량 Form

class InsolationForm extends StatelessWidget {
  const InsolationForm({@required this.title, Key? key}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text(
            title!,
            style: theme.headline3,
          ),
        ),

        // 일사량 GridView
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 26.0, top: 15.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.85,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, int index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 15.0),
                  decoration: CustomDecorations.roundFrameBox(
                      radius: 12.0, opacity: 0.08, blurRadius: 12),
                  child: GridTile(
                    header: Container(
                      decoration: const BoxDecoration(
                        color: AppThemes.blue10,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      height: 40,
                      child: GridTileBar(
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/check.svg',
                              width: 20,
                              height: 20,
                              fit: BoxFit.scaleDown,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const AutoSizeText(
                              '정상',
                              maxLines: 1,
                              maxFontSize: double.infinity,
                              minFontSize: 16.0,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                        top: 48.0,
                        bottom: 16.0,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/clock.svg',
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.scaleDown,
                                  color: AppThemes.blue,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '일 일사량',
                                  style: theme.bodyText1,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Text(
                              '14,479 w/m2',
                              style: theme.headline3,
                            ),
                            const Expanded(child: SizedBox()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  '일 평균 대비',
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style:
                                      theme.bodyText1?.copyWith(fontSize: 14.0),
                                ),
                                AutoSizeText(
                                  '80%',
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style: theme.headline4
                                      ?.copyWith(color: AppThemes.cyan),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.purple700,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            "All Creative works,\n"
                .richText
                .withTextSpanChildren(
                    ["Selected projects.".textSpan.yellow400.make()])
                .xl4
                .white
                .make(),
            20.widthBox,
            Expanded(
                child: VxSwiper(
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              items: [
                InkWell(
                    onTap : () {
                      launch("https://play.google.com/store/apps/details?id=com.dookie.motivationalthoughts&hl=en_GB");
                  },
                    child: ProjectWidget(title: "Mind Renewal (Google Play)")),
                InkWell(
                    onTap : () {
                      launch("https://apps.apple.com/us/app/dookies-motivation/id1504523949?ls=1");
                    },
                    child: ProjectWidget(title: "Mind Renewal (Apple App Store)")),
                InkWell(
                    onTap: () {
                      launch("https://play.google.com/store/apps/details?id=com.snooker.snooker_score_maintainer");
                    },
                    child: ProjectWidget(title: "Snooker Score")),
               // ProjectWidget(title: "ReadyO"),
               // ProjectWidget(title: "Payoye"),
              ],
              height: 170,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ))
          ]).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .neumorphic(color: Vx.purple700, elevation: 5, curve: VxCurve.flat)
        .alignCenter
        .square(200)
        .make()
        .p16();
  }
}

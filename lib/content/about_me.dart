import 'package:flutter/material.dart';
import '../widget/title_of_this_part.dart';
import '../data.dart' as data;

class AboutMe extends StatelessWidget {
  final bool isDesktopView;

  AboutMe(this.isDesktopView);

  final String imagePath = 'asset/me.jpg';
  final double photoSize = 400;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          TitleOfThisPart("About Me"),
          isDesktopView ? buildDeskTopView() : buildMobileView(),
        ],
      ),
    );
  }

  Widget buildDeskTopView() {
    final padding = const EdgeInsets.symmetric(vertical: 80, horizontal: 50);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // introductionText
        Flexible(
          child: Padding(padding: padding, child: buildIntroTextContainer()),
          flex: 3,
        ),

        // image
        Flexible(
          child: Padding(padding: padding, child: buildImage()),
          flex: 3,
        ),
      ],
    );
  }

  Widget buildMobileView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // introductionText
        Padding(
          padding: const EdgeInsets.all(10),
          child: buildIntroTextContainer(),
        ),

        // space
        const SizedBox(height: 10),

        // Image
        Padding(padding: const EdgeInsets.all(10), child: buildImage()),
      ],
    );
  }

  Widget buildImage() {
    return (data.imagePath.isEmpty || data.imagePath == '')
        ? Container(
            height: photoSize,
            width: photoSize,
            color: Colors.amberAccent,
          )
        : Image.asset(data.imagePath, height: photoSize, width: photoSize);
  }

  Widget buildIntroTextContainer() {
    final TextStyle textStyle = const TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18,
      height: 1.5,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    Widget emailBlock = ContactInfoBlock('Email', data.email);
    Widget webSiteBlock = ContactInfoBlock('Website', data.website);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Introduction 1
          Text(data.intro1, style: textStyle),
          const SizedBox(height: 20),

          // Introduction 2
          Text(
            data.intro2,
            style: textStyle.copyWith(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 20),

          Divider(),
          const SizedBox(height: 20),

          // Email and website
          isDesktopView
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: emailBlock, flex: 4),
                    Expanded(child: webSiteBlock, flex: 4),
                    Expanded(child: Container(), flex: 2),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    emailBlock,
                    const SizedBox(height: 30),
                    webSiteBlock,
                  ],
                ),
        ],
      ),
    );
  }
}

class ContactInfoBlock extends StatelessWidget {
  final String title, text;

  ContactInfoBlock(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(text: '$title\n'),
              TextSpan(
                text: text,
                style: TextStyle(height: 2, color: Colors.grey.shade600),
              ),
            ],
          ),
          style: TextStyle(height: 2, color: Colors.black)),
    );
  }
}

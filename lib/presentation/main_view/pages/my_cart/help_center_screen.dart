import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text("Help Center", style: TextStyle(fontWeight: FontWeight.w600)),
            bottom: const TabBar(
                indicatorColor: Color(0xff704f38),
                unselectedLabelColor: AppColors.secondary,
                labelColor: AppColors.primary,
                tabs: [
                  Tab(icon: Text("FAQ", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18))),
                  Tab(icon: Text("Contact Us", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)))
                ])),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TabBarView(
            children: [
              Column(children: [
                const TypesChipsHelpCenter(),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CustomExpansionTitle(
                            isExist: false,
                            title: AppConstants.helpCenterContent[index].title,
                            content: AppConstants.helpCenterContent[index].content),
                        itemCount: AppConstants.helpCenterContent.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 10)))
              ]),
              Column(children: [
                Expanded(
                    child: ListView.separated(
                        itemCount: AppConstants.contactUs.length,
                        itemBuilder: (context, index) => CustomExpansionTitle(
                            title: AppConstants.contactUs[index].title,
                            content: AppConstants.contactUs[index].content,
                            isExist: true,
                            icon: AppConstants.contactUs[index].icon),
                        separatorBuilder: (context, index) => const SizedBox(height: 12)))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class TypesChipsHelpCenter extends StatefulWidget {
  static int selectedChipIndex = 0;

  const TypesChipsHelpCenter({super.key});
  @override
  State<TypesChipsHelpCenter> createState() => _TypesChipsHelpCenterState();
}

class _TypesChipsHelpCenterState extends State<TypesChipsHelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(50),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: AppConstants.privacy.length,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (_, index) => ChoiceChip(
                label: Text(AppConstants.privacy[index]),
                selected: TypesChipsHelpCenter.selectedChipIndex == index,
                onSelected: (selected) => setState(() => TypesChipsHelpCenter.selectedChipIndex = index),
                labelStyle: TextStyle(color: TypesChipsHelpCenter.selectedChipIndex == index ? Colors.white : Colors.black))),
      ),
    );
  }
}

class CustomExpansionTitle extends StatelessWidget {
  final String title, content;
  final bool isExist;
  final IconData icon;
  const CustomExpansionTitle({super.key, required this.title, required this.content, required this.isExist, this.icon = Icons.headphones});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(color: const Color(0x5B9E9E9E))),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                    visible: isExist,
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: Icon(icon, color: AppColors.primary))),
                Text(title, textAlign: TextAlign.start, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600))
              ],
            ),
            shape: const Border(bottom: BorderSide.none, top: BorderSide.none),
            tilePadding: const EdgeInsets.only(left: 5),
            children: [
              const Divider(color: Color(0x5B9E9E9E)),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(content, style: const TextStyle(fontSize: 13, color: AppColors.secondary)))
            ],
          ),
        )
      ],
    );
  }
}

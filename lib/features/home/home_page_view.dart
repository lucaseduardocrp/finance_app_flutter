import 'dart:developer';
import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/widgets/custom_bottom_app_bar.dart';
import 'package:finance_app/features/home/home_page.dart';
import 'package:finance_app/features/profile/profile_page.dart';
import 'package:finance_app/features/stats/stats_page.dart';
import 'package:finance_app/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          StatsPage(),
          WalletPage(),
          ProfilePage()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor100,
        shape: const CircleBorder(),
        onPressed: (){},
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColors.primaryColor100,
        children: [
          CustomBottomAppBarItem(
            label: 'home',
            icon: Icons.home,
            onPressed: () => pageController.jumpToPage(0)
          ),
          CustomBottomAppBarItem(
            label: 'stats',
            icon: Icons.signal_cellular_alt,
            onPressed: () => pageController.jumpToPage(2)
          ),
          CustomBottomAppBarItem(
            label: 'wallet',
            icon: Icons.account_balance_wallet_rounded,
            onPressed: () => pageController.jumpToPage(3)
          ),
          CustomBottomAppBarItem(
            label: 'profile',
            icon: Icons.person,
            onPressed: () => pageController.jumpToPage(4)
          ),
        ],
      ),
    );
  }  
}
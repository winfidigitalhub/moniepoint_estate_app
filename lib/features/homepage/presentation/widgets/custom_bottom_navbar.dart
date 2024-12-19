import 'package:flutter/material.dart';



class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem("assets/images/search_nav_icon.png", 0),
          _buildNavItem("assets/images/message_nav_icon.png", 1),
          _buildNavItem("assets/images/home_nav_icon.png", 2),
          _buildNavItem("assets/images/favourite_nav_icon.png", 3),
          _buildNavItem("assets/images/profile_nav_icon.png", 4,)
        ],
      ),
    );
  }

  Widget _buildNavItem(String iconDir, int index) {
    return GestureDetector(
      onTap: () => onTap(index), // Home button action
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: currentIndex == index ? const Color(0xffFC9D11) : null,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          iconDir,
          // color: Colors.white,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
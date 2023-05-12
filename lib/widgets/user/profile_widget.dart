import 'package:flutter/material.dart';
import 'package:pet_sitting/styles.dart';

class ProfileWidget extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback onTap;

  const ProfileWidget({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: onTap,
        child: Stack(children: [
          _buildImage(),
          Positioned(bottom: 0, right: 4, child: _buildEditIcon()),
        ]),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            spreadRadius: 8.0,
            blurRadius: 10.0,
            color: Colors.black26,
          )
        ],
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 128,
            height: 128,
          ),
        ),
      ),
    );
  }

  Widget _buildEditIcon() => _buildCircle(
        color: Colors.white,
        all: 3,
        child: _buildCircle(
          color: MAIN_GREEN,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget _buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

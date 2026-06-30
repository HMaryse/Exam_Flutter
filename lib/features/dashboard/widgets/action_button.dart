import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  final IconData icon;

  final String title;

  final VoidCallback onTap;

  const ActionButton({

    super.key,

    required this.icon,

    required this.title,

    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: onTap,

      borderRadius: BorderRadius.circular(18),

      child: Container(

        width: 95,

        height: 95,

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(18),

          boxShadow: const [

            BoxShadow(

              blurRadius: 10,

              color: Colors.black12,

            )

          ],

        ),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(

              icon,

              color: const Color(0xFF1E3A8A),

            ),

            const SizedBox(height: 12),

            Text(

              title,

              style: const TextStyle(

                fontWeight: FontWeight.w600,

              ),

            )

          ],

        ),

      ),

    );

  }

}
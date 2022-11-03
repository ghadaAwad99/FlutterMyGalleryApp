import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final String arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 2.0, start: 16),
          child: Text("Welcome\n $arguments", style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric( vertical: 2,horizontal: 16.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage('https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-2379004.jpg&fm=jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
        ),
      ],
    );
  }
}
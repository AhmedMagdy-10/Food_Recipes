import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/cubit/home_cubit.dart';
import 'package:recipes_app/cubit/home_states.dart';
import 'package:recipes_app/views/widgets/custom_button.dart';

class SwitchCustomButton extends StatelessWidget {
  const SwitchCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitStates>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                color: BlocProvider.of<HomeCubit>(context).isInstructions
                    ? Colors.black45
                    : Colors.blue,
                onTapButton: () {
                  BlocProvider.of<HomeCubit>(context).changebutton();
                },
                radius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: const Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomButton(
                onTapButton: () {
                  BlocProvider.of<HomeCubit>(context).changebutton();
                },
                radius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: BlocProvider.of<HomeCubit>(context).isInstructions
                    ? Colors.blue
                    : Colors.black45,
                child: const Text(
                  'instructions',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

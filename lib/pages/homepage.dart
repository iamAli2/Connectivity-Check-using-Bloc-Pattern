import 'package:firstbloc/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: ((context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Connected".text.make(),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Not Connected".text.green400.make(),
                backgroundColor: Colors.red,
              ));
            } else {
              return null;
            }
          }),
          builder: (context, state) {
            if (state == InternetState.Gained) {
              return "Connected".text.xl3.makeCentered();
            } else if (state == InternetState.Lost) {
              return "Not Connected".text.xl3.makeCentered();
            } else {
              return "Loading ....".text.xl3.makeCentered();
            }
          },
        ),
      ),
    );
  }
}

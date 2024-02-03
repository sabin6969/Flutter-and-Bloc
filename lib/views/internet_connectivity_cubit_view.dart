import 'package:blocpracticeapp/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubitView extends StatelessWidget {
  const InternetCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    InternetCubit internetCubit = InternetCubit();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Internet Cubit",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<InternetCubit, InternetState>(
        bloc: internetCubit,
        builder: (context, state) {
          if (state == InternetState.gained) {
            return const Center(
              child: Text("Connected to internet"),
            );
          } else if (state == InternetState.lost) {
            return const Center(
              child: Text("No internet"),
            );
          } else {
            return const Center(
              child: Text("Loading"),
            );
          }
        },
        listener: (context, state) {
          if (state == InternetState.gained) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Connected to internet"),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Lost internet Connetion"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}

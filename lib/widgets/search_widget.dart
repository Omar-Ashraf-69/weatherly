import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherly/cuibts/weather_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              await BlocProvider.of<WeatherCubit>(context)
                  .getWeatherCubit(value);
              
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            keyboardType: TextInputType.name,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(24),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(),
              hoverColor: Colors.amber,
              fillColor: Colors.amber,
              focusColor: Colors.amber,
              hintText: 'Enter city name',
              hintStyle: TextStyle(color: Colors.grey),
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

AppBar buildAppBar(
    {required ThemeData theme,
    required final String title,
    required final VoidCallback onPressed}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back),
      iconSize: 30,
      color: Colors.black,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: theme.textTheme.titleLarge,
    ),
  );
}

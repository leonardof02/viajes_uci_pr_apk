import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:viajes_uci_pr/pages/home_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://gwjrmxawwreegdqkfisb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd3anJteGF3d3JlZWdkcWtmaXNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDIyNjQ1ODIsImV4cCI6MjAxNzg0MDU4Mn0.J_eqm7Cn8bpOuQsFE87yvm91_4TxrfsMTw6PXsLoAkI',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
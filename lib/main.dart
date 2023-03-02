import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _newRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: "a",
          name: 'a',
          builder: (context, state) => const PageA(),
          routes: [
            GoRoute(
              path: "b",
              name: 'b',
              builder: (context, state) => PageB(),
              routes: [
                GoRoute(
                  path: "c",
                  name: 'c',
                  builder: (context, state) => PageC(),
                )
              ],
            )
          ],
        )
      ],
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _newRouter,
      title: "Go router",
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pushNamed("a",),
          child: const Text("Go to Settings page"),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("PageA"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pushNamed("b"),
          child: const Text("Go to b"),
        ),
      ),
    );
  }
}
class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("PageB"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pushNamed("c"),
          child: const Text("Go to c"),
        ),
      ),
    );
  }
}
class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("PageC"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}

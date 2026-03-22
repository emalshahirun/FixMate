class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Change Password",
      body: Container(),
    );
  }
}
body: Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [],
  ),
),
children: [
  TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Current Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  const SizedBox(height: 12),
  TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: "New Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  const SizedBox(height: 12),
  TextField(
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Confirm Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
],

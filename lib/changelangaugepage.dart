class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      title: "Change Language",
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
child: Column(
  children: [
    _buildLanguageOption("English", "English", true),
    _buildLanguageOption("Sinhala", "Sinhala", false),
    _buildLanguageOption("Tamil", "Tamil", false),
  ],
),
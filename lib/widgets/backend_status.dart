class BackendStatus extends StatefulWidget {
     final bool showText;
     final bool compact;
  const BackendStatus({super.key});

  @override
  State<BackendStatus> createState() => _BackendStatusState();
}

class _BackendStatusState extends State<BackendStatus> {
      bool _isConnected = false;
      bool _isChecking = true;
      String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
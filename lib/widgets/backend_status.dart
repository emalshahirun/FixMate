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
      void initState() {
         super.initState();
         _checkConnection();
      }

      Future<void> _checkConnection() async {
         setState(() {
              _isChecking = true;
              _errorMessage = '';
         })
        final isConnected = await ApiService.checkHealth();
      }

      @override
      Widget build(BuildContext context) {
        return Container();
      }
}
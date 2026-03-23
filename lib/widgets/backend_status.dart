import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class BackendStatus extends StatefulWidget {
     final bool showText;
     final bool compact;
  const BackendStatus({
      super.key,
      this.showText = true,
      this.compact = false,
  });

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
      }  )

        final isConnected = await ApiService.checkHealth();
        if (mounted) {
              setState(() {
                _isConnected = isConnected;
                _isChecking = false;
                if (!isConnected) {
                  _errorMessage = 'Cannot connect to backend';
                }
              });

        }
      }

      @override
      Widget build(BuildContext context) {
      if (widget.compact) {
            return Tooltip(
              message: _isChecking
                  ? 'Checking backend...'
                  : (_isConnected ? 'Backend connected' : 'Backend offline'),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isChecking
                      ? Colors.orange
                      : (_isConnected ? Colors.green : Colors.red),
                ),
              ),
            );
          }

        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _isChecking
                        ? Colors.orange.withOpacity(0.1)
                        : (_isConnected
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  }
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isChecking
                            ? Icons.hourglass_empty
                            : (_isConnected ? Icons.check_circle : Icons.error),
                        size: 14,
                        color: _isChecking
                            ? Colors.orange
                            : (_isConnected ? Colors.green : Colors.red),
                      ),
                      if (widget.showText) ...[
                        const SizedBox(width: 4),
                        Text(
                          _isChecking
                              ? 'Connecting...'
                              : (_isConnected ? 'Online' : 'Offline'),
                          style: TextStyle(
                            fontSize: 11,
                            color: _isChecking
                                ? Colors.orange
                                : (_isConnected ? Colors.green : Colors.red),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
            });
      }
}
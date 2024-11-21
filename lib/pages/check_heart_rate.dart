import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:heart_bpm/heart_bpm.dart';
import '../services/bpm_provider.dart';

class CheckHeartBeatRate extends StatefulWidget {
  const CheckHeartBeatRate({super.key});

  @override
  State<CheckHeartBeatRate> createState() => _CheckHeartBeatRateState();
}

class _CheckHeartBeatRateState extends State<CheckHeartBeatRate> {
  List<SensorValue> data = []; // To store raw sensor values
  bool isBPMEnabled = false; // To toggle BPM measurement

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hear Beat"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Cover both the camera and flash with your finger",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.favorite,
                  size: 90,
                  color: Colors.red,
                ),
                const SizedBox(width: 20),
                Consumer<BpmProvider>(
                  builder: (context, bpmProvider, child) {
                    return Text(
                      bpmProvider.bpmValue > 0
                          ? bpmProvider.bpmValue.toString()
                          : "No Data", // Display BPM value
                      style: const TextStyle(fontSize: 50),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.favorite_rounded),
              label: Text(isBPMEnabled ? "Stop Measurement" : "Measure BPM"),
              onPressed: _toggleBPMMeasurement,
            ),
            const SizedBox(height: 20),
            if (isBPMEnabled)
              HeartBPMDialog(
                context: context,
                onRawData: _updateRawData,
                onBPM: _updateBPM,
              ),
          ],
        ),
      ),
    );
  }

  void _toggleBPMMeasurement() {
    setState(() {
      isBPMEnabled = !isBPMEnabled;
    });
  }

  void _updateRawData(SensorValue value) {
    setState(() {
      if (data.length == 100) data.removeAt(0);
      data.add(value);
    });
  }

  void _updateBPM(int value) {
    // Use Provider to update the BPM value
    Provider.of<BpmProvider>(context, listen: false).updateBpm(value);
  }
}

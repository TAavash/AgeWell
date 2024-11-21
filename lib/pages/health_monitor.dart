import 'package:flutter/material.dart';
import 'package:heart_bpm/heart_bpm.dart';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({Key? key}) : super(key: key);

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  bool isMeasuring = false;
  int? bpmValue; // Use nullable type for BPM value

  List<HeartRateRecord> records = [
    HeartRateRecord(DateTime(2024, 11, 18), 80),
    HeartRateRecord(DateTime(2024, 11, 19), 85),
  ];

  void toggleMeasurement() {
    setState(() {
      isMeasuring = !isMeasuring;
    });
  }

  void updateBPM(int value) {
    setState(() {
      bpmValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF90EE90),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Heart Rate',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Cover both the camera and flash with your finger',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, size: 60, color: Colors.red),
                const SizedBox(width: 16),
                Text(
                  bpmValue?.toString() ?? '-',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
                const SizedBox(width: 8),
                Text('bpm',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: toggleMeasurement,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[100],
                foregroundColor: Colors.purple,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                isMeasuring ? 'Stop Measurement' : 'Start Measurement',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            if (isMeasuring)
              HeartBPMDialog(
                context: context,
                onRawData: (value) {},
                onBPM: updateBPM, // Update BPM when available
              ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: toggleMeasurement,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.fingerprint, size: 80, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) =>
                    _buildRecordTile(records[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordTile(HeartRateRecord record) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 20, color: Colors.purple),
          const SizedBox(width: 8),
          Text('${record.date.year}-${record.date.month}-${record.date.day}',
              style: TextStyle(fontWeight: FontWeight.w500)),
          Spacer(),
          Text('HR', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 8),
          Text('${record.bpm}',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
        ],
      ),
    );
  }
}

class HeartRateRecord {
  final DateTime date;
  final int bpm;

  HeartRateRecord(this.date, this.bpm);
}

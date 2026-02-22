import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final res = controller.ressource;
        final status = controller.status;
        final progress = controller.progress;
        final downloadedSize = (progress * res.size).toInt();
        final totalSize = res.size;
        final percent = (progress * 100).toStringAsFixed(1);
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(res.name, style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Text(
                        '$percent % completed - $downloadedSize of $totalSize MB',
                        style: TextStyle(
                          color: Color(0xFF60B0E5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (status == DownloadStatus.notDownloaded)
                  IconButton(
                    icon: Icon(Icons.download_outlined, color: Colors.grey[700]),
                    onPressed: controller.startDownload,
                  )
                else if (status == DownloadStatus.downloading)
                  Icon(Icons.sync, color: Colors.grey[700])
                else if (status == DownloadStatus.downloaded)
                  Icon(Icons.folder, color: Colors.grey[700]),
              ],
            ),
          ),
        );
      },
    );

    // TODO
  }
}

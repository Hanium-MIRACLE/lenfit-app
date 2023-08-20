import 'dart:typed_data';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as imglib;

import 'image_analysis_preview.dart';

class CameraPreviewDisplayer extends StatefulWidget {
  final Stream<AnalysisImage> analysisImageStream;

  const CameraPreviewDisplayer({
    super.key,
    required this.analysisImageStream,
  });

  @override
  State<CameraPreviewDisplayer> createState() => _CameraPreviewDisplayerState();
}

class _CameraPreviewDisplayerState extends State<CameraPreviewDisplayer> {
  // 1.
  Uint8List? _cachedJpeg;

  @override
  Widget build(BuildContext context) {
    return Center(
      // 2.
      child: StreamBuilder<AnalysisImage>(
        stream: widget.analysisImageStream,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }

          final img = snapshot.requireData;
          // 3.
          return img.when(jpeg: (image) {
            // 4.
            _cachedJpeg = _applyFilterOnBytes(image.bytes);

            return ImageAnalysisPreview(
              currentJpeg: _cachedJpeg!,
              width: image.width.toDouble(),
              height: image.height.toDouble(),
            );
          }, yuv420: (Yuv420Image image) {
            // 5.
            return FutureBuilder<JpegImage>(
                future: image.toJpeg(),
                builder: (_, snapshot) {
                  if (snapshot.data == null && _cachedJpeg == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data != null) {
                    // 6.
                    _cachedJpeg = _applyFilterOnBytes(
                      snapshot.data!.bytes,
                    );
                  }
                  return ImageAnalysisPreview(
                    currentJpeg: _cachedJpeg!,
                    width: image.width.toDouble(),
                    height: image.height.toDouble(),
                  );
                });
          }, nv21: (Nv21Image image) {
            // 7.
            return FutureBuilder<JpegImage>(
                future: image.toJpeg(),
                builder: (_, snapshot) {
                  if (snapshot.data == null && _cachedJpeg == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data != null) {
                    _cachedJpeg = _applyFilterOnBytes(
                      snapshot.data!.bytes,
                    );
                  }
                  return ImageAnalysisPreview(
                    currentJpeg: _cachedJpeg!,
                    width: image.width.toDouble(),
                    height: image.height.toDouble(),
                  );
                });
          }, bgra8888: (Bgra8888Image image) {
            // 8.
            _cachedJpeg = _applyFilterOnImage(
              imglib.Image.fromBytes(
                width: image.width,
                height: image.height,
                bytes: image.planes[0].bytes.buffer,
                order: imglib.ChannelOrder.bgra,
              ),
            );

            return ImageAnalysisPreview(
              currentJpeg: _cachedJpeg!,
              width: image.width.toDouble(),
              height: image.height.toDouble(),
            );
            // We handle all formats so we're sure there won't be a null value
          })!;
        },
      ),
    );
  }

  Uint8List _applyFilterOnBytes(Uint8List bytes) {
    return _applyFilterOnImage(imglib.decodeJpg(bytes)!);
  }

  Uint8List _applyFilterOnImage(imglib.Image image) {
    return imglib.encodeJpg(
      imglib.grayscale(image),
      quality: 70,
    );
  }
}

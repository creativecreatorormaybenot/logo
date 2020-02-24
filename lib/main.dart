import 'dart:ui' as ui;
import 'dart:typed_data';

void draw(ui.Canvas canvas, ui.Rect rect) {
  canvas.scale(rect.height / 202, rect.height / 202);
  canvas.translate((200 - 166) / 2, 0);

  final mediumPaint = ui.Paint()..color = const ui.Color(0xff42a5f5),
      lightPaint = ui.Paint()..color = mediumPaint.color.withOpacity(.8),
      darkPaint = ui.Paint()..color = const ui.Color(0xff0d47a1);

  canvas.drawPath(
      ui.Path()
        ..moveTo(37.7, 128.9)
        ..lineTo(9.8, 101)
        ..lineTo(100.4, 10.4)
        ..lineTo(156.2, 10.4),
      lightPaint);
  canvas.drawPath(
      ui.Path()
        ..moveTo(156.2, 94)
        ..lineTo(100.4, 94)
        ..lineTo(79.5, 114.9)
        ..lineTo(107.4, 142.8),
      lightPaint);
  canvas.drawPath(
      ui.Path()
        ..moveTo(79.5, 170.7)
        ..lineTo(100.4, 191.6)
        ..lineTo(156.2, 191.6)
        ..lineTo(107.4, 142.8),
      darkPaint);

  canvas.save();
  canvas.transform(Float64List.fromList(const <double>[
    // comment to preserve formatting
    .7071, -.7071, 0, 0,
    .7071, .7071, 0, 0,
    0, 0, 1, 0,
    -77.697, 98.057, 0, 1,
  ]));
  canvas.drawRect(const ui.Rect.fromLTWH(59.8, 123.1, 39.4, 39.4), mediumPaint);
  canvas.restore();

  canvas.drawPath(
      ui.Path()
        ..moveTo(79.5, 170.7)
        ..lineTo(120.9, 156.4)
        ..lineTo(107.4, 142.8),
      ui.Paint()
        ..shader = ui.Gradient.linear(
          const ui.Offset(125.1715, 152.2773),
          const ui.Offset(80.8297, 158.5341),
          const <ui.Color>[
            ui.Color(0xbfffffff),
            ui.Color(0xbffcfcfc),
            ui.Color(0xbff4f4f4),
            ui.Color(0xbfe5e5e5),
            ui.Color(0xbfd1d1d1),
            ui.Color(0xbfb6b6b6),
            ui.Color(0xbf959595),
            ui.Color(0xbf6e6e6e),
            ui.Color(0xbf616161),
          ],
          <double>[
            0.2690,
            0.4093,
            0.4972,
            0.5708,
            0.6364,
            0.6968,
            0.7533,
            0.8058,
            0.8219,
          ],
        )
        ..blendMode = ui.BlendMode.multiply);
  canvas.drawPath(
      ui.Path()
        ..moveTo(107.4, 142.8)
        ..lineTo(79.5, 170.7)
        ..lineTo(86.1, 177.3)
        ..lineTo(114.0, 149.4),
      ui.Paint()
        ..shader = ui.Gradient.linear(
          const ui.Offset(62.3643 + 37.9092, 40.135 + 123.4389),
          const ui.Offset(54.0376 + 37.9092, 31.8083 + 123.4389),
          const <ui.Color>[
            ui.Color(0x80ffffff),
            ui.Color(0x80fcfcfc),
            ui.Color(0x80f4f4f4),
            ui.Color(0x80e5e5e5),
            ui.Color(0x80d1d1d1),
            ui.Color(0x80b6b6b6),
            ui.Color(0x80959595),
            ui.Color(0x806e6e6e),
            ui.Color(0x80616161),
          ],
          <double>[
            0.4588,
            0.5509,
            0.6087,
            0.6570,
            0.7001,
            0.7397,
            0.7768,
            0.8113,
            0.8219,
          ],
        )
        ..blendMode = ui.BlendMode.multiply);
}

void main() {
  ui.window.onBeginFrame = paint;
  ui.window.scheduleFrame();
}

void paint(Duration t) {
  final bounds = ui.Offset.zero &
          (ui.window.physicalSize / ui.window.devicePixelRatio),
      recorder = ui.PictureRecorder(),
      canvas = ui.Canvas(recorder, bounds);

  draw(canvas, bounds);

  final picture = recorder.endRecording(),
      builder = ui.SceneBuilder()
        ..pushTransform(Float64List(16)
          ..[0] = ui.window.devicePixelRatio
          ..[5] = ui.window.devicePixelRatio
          ..[10] = 1
          ..[15] = 1)
        ..addPicture(ui.Offset.zero, picture)
        ..pop();

  ui.window.render(builder.build());
  ui.window.scheduleFrame();
}

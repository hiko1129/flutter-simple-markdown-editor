import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Editor extends StatefulWidget {
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  int _tappedCount = 1;
  String _text = '';
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    var showEditor = !(_tappedCount % 3 == 0);
    if (!showEditor) {
      _textEditingController.text = _text;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Markdown Editor'),
      ),
      body: Column(
        children: <Widget>[
          showEditor
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onTap: () {
                        setState(() => {this._tappedCount++});
                      },
                      onChanged: (value) {
                        setState(() {
                          _text = value;
                        });
                      },
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox.expand(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() => {this._tappedCount++});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MarkdownBody(data: this._text),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
  }
}

/* Copyright 2018 Rejish Radhakrishnan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. */

import 'package:flutter/material.dart';
import 'package:ranepa_timetable/timeline_model.dart';
import 'package:ranepa_timetable/timeline_painter.dart';

class TimelineElement extends StatelessWidget {
  final TimelineModel model;
  final bool firstElement;
  final bool lastElement;

  TimelineElement(
      {@required this.model,
      this.firstElement = false,
      this.lastElement = false});

  Widget _buildLine(BuildContext context) {
    return SizedBox.expand(
        child: Container(
      child: CustomPaint(
        painter: TimelinePainter(context, model,
            firstElement: firstElement, lastElement: lastElement),
      ),
    ));
  }

  Widget _buildContentColumn(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20.0, left: 140.0),
          child: Text(
            model.lesson.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 45.0, left: 140.0, right: 15),
          child: new SizedBox(
            height: 22,
            child: new SingleChildScrollView(
              child: new Text(
                model.teacher.toString(),
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 55.0, left: 50.0),
          child: Text(
            model.room.number.toString(),
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15.0, left: 15.0),
          width: 80,
          child: Text(
            model.start.format(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 35.0, left: 15.0),
          width: 80,
          child: Text(
            model.finish.format(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.body2,
          ),
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context) {
    return Container(
      height: 80.0,
      child: Stack(
        children: <Widget>[
          _buildLine(context),
          _buildContentColumn(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRow(context);
  }
}
/*
 * Copyright 2020 Simon Pham. All rights reserved.
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import 'package:fluda/utils/string_utils.dart';
import 'package:url_launcher/url_launcher.dart' as url;

extension StringExt on String {
  /// Return `true` if the string [this] is `null` or empty
  bool get isEmptyOrNull => this == null || isEmpty;

  bool validate(Pattern pattern) {
    return RegexUtils.check(this, pattern);
  }

  bool validateEmail() {
    return RegexUtils.check(this, RegexUtils.email);
  }

  Future launch() async {
    if (await url.canLaunch(this)) {
      return url.launch(this);
    }
  }
}

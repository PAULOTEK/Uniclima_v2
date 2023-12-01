library configs;

import 'package:flutter/foundation.dart';
import 'package:projeto_uniclima_v2/config/environment_config.dart';

const baseUrl =
    kDebugMode ? EnvironmentConfig.devUrl : EnvironmentConfig.prodUrl;

const urlUserData = 'profile';
const keyOpenweathermap = 'bf6d2fe11b800f9f57d608aaf6957478';

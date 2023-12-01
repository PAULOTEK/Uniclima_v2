library configs;

import 'package:flutter/foundation.dart';
import 'package:projeto_uniclima_v2/config/environment_config.dart';

const baseUrl =
    kDebugMode ? EnvironmentConfig.devUrl : EnvironmentConfig.prodUrl;

const urlUserData = 'profile';
const keyOpenweathermap = '65d7bbf43a1a218d1c43d651e08c6e64';

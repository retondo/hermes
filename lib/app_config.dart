import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static Future init(environment) async {
    if (environment != 'dev' && environment != 'prod') {
      throw('Environment name should be "dev" or "prod"');
    }
    await DotEnv().load();
  }

  static get(varName) {
    if (!DotEnv().isEveryDefined([varName])) {
      throw('Variable "$varName" not defined');
    }
    return DotEnv().env['$varName'];
  }
}

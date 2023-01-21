import 'package:provider/single_child_widget.dart';

class ProviderManager {
  ProviderManager._init();
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  List<SingleChildWidget> listOfProvider = [];
}

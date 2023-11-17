class ServicesSetUp {
  ServicesSetUp._constructor();
  static final ServicesSetUp instance = ServicesSetUp._constructor();

  final Map _services = {};
  void addService<T extends Object>(T instance) {
    _services[T] = instance;
  }

  T getService<T>() {
    return _services[T];
  }
}

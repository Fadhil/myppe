class BaseRoutes {
  constructor() {
    this.routes = [];
  }

  addRoute(uri, httpMethod, controllerClass, action) {
    this.routes.push({
      controllerClass,
      action,
      uri,
      httpMethod
    });
  }
}

export default BaseRoutes;

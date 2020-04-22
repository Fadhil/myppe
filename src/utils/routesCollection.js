class RoutesCollection {
  /* eslint-disable no-param-reassign */
  static addRouteData(controller, action, routeData) {
    routeData.controller = controller.name;
    routeData.action = action;

    if (!RoutesCollection[controller.name]) {
      RoutesCollection[controller.name] = {};
    }

    RoutesCollection[controller.name] = {
      ...RoutesCollection[controller.name],
      [action]: routeData
    };
  }
}

export default RoutesCollection;

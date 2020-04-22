import URIGenerator from './utils/uriGenerator';

import constants from './config/constants';

class Boot {
  constructor(router, service) {
    this.router = router;
    this.service = service;
    this.appRegisterRoute = this.appRegisterRoute.bind(this);
    this.appCreateRouteAction = this.appCreateRouteAction.bind(this);
  }

  appRegisterRoute(uri, httpMethod, boundAction) {
    throw new Error('Not Implemented Exception');
  }

  appCreateRouteAction(controllerClass, method) {
    const result = [
      (req, res) => {
        this.buildControllerInstance(controllerClass, req, res)[method](
          req,
          res
        );
      }
    ];

    return result;
  }

  buildControllerInstance(ControllerClass, req, res) {
    return new ControllerClass({
      base: `${req.protocol}://${req.get('host')}`,
      req,
      params: req.params,
      query: req.query,
      body: req.body,
      service: this.service,
      constants,
      uriGenerator: new URIGenerator(),
      send: (statusCode, resource, location) => {
        if (location) {
          res.location(location);
        }
        res.status(statusCode).json(resource);
      }
    });
  }

  run() {
    this.service.registerServices();
    this.router.registerRoutes(
      this.appRegisterRoute,
      this.appCreateRouteAction
    );
  }
}

export default Boot;

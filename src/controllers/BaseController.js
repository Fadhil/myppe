class BaseController {
  constructor({
    params,
    query,
    req,
    body,
    send,
    uriGenerator,
    logger,
    service,
    constants
  }) {
    this.uriGenerator = uriGenerator;
    this.params = params;
    this.query = query;
    this.req = req;
    this.body = body;
    this.send = send;
    this.logger = logger;
    this.service = service;
    this.constants = constants;
  }

  error(err) {
    const status = err.statusCode || err.status;
    const statusCode = status || 500;
    this.send(statusCode);
  }

  errorResponse(status, message, data) {
    const jsonData = { status: 'error', message, data };

    const statusCode = status;
    this.send(statusCode, jsonData);
  }

  created(location, data) {
    if (location) {
      this.send(201, null, location);
    }

    this.send(201, data);
  }

  ok(data) {
    this.send(200, data);
  }

  okResponse(data, message = '', status = 200) {
    const jsonData = {};
    jsonData.status = 'success';

    if (data !== null) jsonData.data = data;
    if (message !== '') jsonData.message = message;

    this.send(status, jsonData);
  }

  noContent() {
    this.send(204);
  }
}

export default BaseController;

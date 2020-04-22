import express from 'express';
import bodyParser from 'body-parser';
import compression from 'compression';
import cors from 'cors';
import helmet from 'helmet';

import Boot from './boot';

class App extends Boot {
  constructor(router, service) {
    super(router, service);
    const { PORT, NODE_ENV, HOST } = process.env;
    this.express = express();
    this.port = PORT;
    this.env = NODE_ENV;
    this.host = HOST;
    this.expressRouter = express.Router();
  }

  appRegisterRoute(uri, httpMethod, boundAction) {
    this.expressRouter.route(uri)[httpMethod](boundAction);
  }

  registerMiddlewares() {
    this.express.use(compression());
    this.express.use(bodyParser.json());
    this.express.use(cors());
    this.express.use(helmet());
    this.express.use(bodyParser.urlencoded({ extended: true }));
  }

  run() {
    super.run();
    this.registerMiddlewares();
    this.express.use('/', this.expressRouter);

    if (this.env === 'local' || this.env === 'test') {
      this.express.listen(this.port, this.host);
      console.log(
        `🚀 Server ready at http://${this.host}:${this.port}`,
      );
    }

    return this.express;
  }
}

export default App;

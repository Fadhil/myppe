import serverless from 'serverless-http';

const serverMode = process.env.SERVER_MODE;

import { S3 } from 'aws-sdk';

import App from './app';
import Router from './routes';
import ApiRoutes from './routes/api.routes';
import db from './models';
import Service from './services';
import Respository from './repositories';

const router = new Router([new ApiRoutes()]);
const storage = new S3({
  signatureVersion: 'v4'
});

const repository = new Respository(db);
const service = new Service(repository, storage);
const server = new App(router, service);

if(serverMode === 'serverless') {
  const expressHandler = serverless(server.run());
  module.exports.handler = async (event, context) => {
    const result = await expressHandler(event, context);
    return result;
  };
} else {
  server.run();
}

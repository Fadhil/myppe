import fs from 'fs';
import dotenv from 'dotenv';
import 'dotenv/config';
import { mapKeys } from 'lodash';

const config = env => {
  if (env !== 'production') {
    const loadEnvFile = `${process.env.PWD}/.env.${env}`;
    const envConfig = dotenv.parse(fs.readFileSync(loadEnvFile));

    mapKeys(envConfig, (v, k) => {
      process.env[k] = v;
    });
  }

  return process.env;
};

export default config;

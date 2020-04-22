import envConf from './config';

export default env => {
  envConf(env);
  const {
    DB_USERNAME,
    DB_PASSWORD,
    DB_DATABASE,
    DB_HOST,
    DB_OPERATORSALIASES,
    NODE_ENV
  } = process.env;

  return {
    username: DB_USERNAME,
    password: DB_PASSWORD !== 'null' ? DB_PASSWORD : null,
    database: DB_DATABASE,
    host: DB_HOST,
    dialect: 'mysql', // DB_DIALECT can configure later,
    operatorsAliases: DB_OPERATORSALIASES,
    dialectOptions: {
      ssl: {
        rejectUnauthorized: NODE_ENV === 'production'
      }
    }
  };
};

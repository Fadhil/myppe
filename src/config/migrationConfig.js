const {
  DB_USERNAME,
  DB_PASSWORD,
  DB_DATABASE,
  DB_HOST,
  DB_OPERATORSALIASES
} = process.env;

module.exports = {
  development: {
    username: DB_USERNAME,
    password: DB_PASSWORD !== 'null' ? DB_PASSWORD : null,
    database: DB_DATABASE,
    host: DB_HOST,
    dialect: 'mysql',
    operatorsAliases: DB_OPERATORSALIASES,
    migrationStorageTableName: 'migrations'
  },
  staging: {
    username: DB_USERNAME,
    password: DB_PASSWORD !== 'null' ? DB_PASSWORD : null,
    database: DB_DATABASE,
    host: DB_HOST,
    dialect: 'mysql',
    operatorsAliases: DB_OPERATORSALIASES,
    migrationStorageTableName: 'migrations'
  },
  production: {
    username: DB_USERNAME,
    password: DB_PASSWORD !== 'null' ? DB_PASSWORD : null,
    database: DB_DATABASE,
    host: DB_HOST,
    dialect: 'mysql',
    operatorsAliases: DB_OPERATORSALIASES,
    migrationStorageTableName: 'migrations'
  }
};

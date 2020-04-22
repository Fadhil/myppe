import Joi from '@hapi/joi';
import httpStatus from 'http-status';
import { pick } from 'lodash';

import AppError from '../Utils/appError';

/**
 *Process request against the validation schema
 *
 * @param {*} schema validation schema
 */
const validate = (schema) => (req, res, next) => {
  const validSchema = pick(schema, ['params', 'query', 'body']);

  console.log('req body validation', req.body);
  const object = pick(req, Object.keys(validSchema));
  const { value, error } = Joi.compile(validSchema)
    .prefs({ errors: { label: 'key' } })
    .validate(object);

  if (error) {
    const errorMessage = error.details
      .map((details) => details.message)
      .join(', ');
    return next(new AppError(httpStatus.BAD_REQUEST, errorMessage));
  }
  Object.assign(req, value);
  return next();
};

export default validate;

import httpStatus from 'http-status';
import moment from 'moment';
import jwt from 'jsonwebtoken';

import config from '../Config/config';
import AppError from '../Utils/appError';

export const generateToken = (userId, expires, secret = config.jwt.secret) => {
  console.log('genrating.....');
  console.log(secret, config);

  let payload = {};

  if (expires) {
    payload = {
      sub: userId,
      iat: moment().unix(),
      exp: expires.unix(),
    };
  } else {
    payload = {
      sub: userId,
      iat: moment().unix(),
    };
  }

  return jwt.sign(payload, secret);
};

const verifyToken = async (token, type) => {
  const payload = jwt.verify(token, config.jwt.secret);
  //   const tokenDoc = await Token.findOne({
  //     token,
  //     type,
  //     user: payload.sub,
  //     blacklisted: false,
  //   });
  if (!tokenDoc) {
    throw new AppError(httpStatus.NOT_FOUND, 'Token not found');
  }
  return tokenDoc;
};

export const verifyMLAPIToken = async (token, type) => {
  const payload = jwt.verify(token, config.jwt.secret);

  if (payload.sub !== config.ml.payload) {
    throw new AppError(httpStatus.NOT_FOUND, 'Token not found');
  }
  return true;
};

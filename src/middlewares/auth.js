import jwt from 'jsonwebtoken';

import constants from '../config/constants';
import db from '../models';

const auth = async (req, res, next) => {
  let token = req.headers['x-access-token'] || req.headers.authorization;
  if (!token) return res.status(401).json({ message: 'unAuthorized!'});

  try {

    if(token.startsWith('Bearer ')) {
      token = token.slice(7, token.length);
    }

    if(token) {
     const payload = jwt.verify(token, constants.JWT_SECRET);

     if (payload.uuid === null || payload.uuid === undefined) {
        return res.status(401).json({ message: 'Invalid token.'});
     }

     // let`s fetch the userInfo and send it to first layer
     const user = await db.User.findOne({
       where: { uuid: payload.uuid }
     });

     if(!user) {
      return res.status(401).json({ message: 'Invalid token.'});
     }

     const AuthUser = { id: user.id, uuid: user.uuid, name: user.name, email: user.email };

     req.AuthUser = AuthUser;
     next();
    }
  } catch (error) {
    console.log('Auth Error', error);
    return res.status(401).json({ message: 'Invalid Token!'});
  }
};

export default auth;

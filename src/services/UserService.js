import { v4 as uuidv4 } from 'uuid';
import jwt from 'jsonwebtoken';

import BaseService from './BaseService';

class UserService extends BaseService {
  constructor(repository) {
    super(repository);
    this.repository = repository;
  }

  async register(data) {
    try {
      const uuid = uuidv4();
      const fields = { uuid, ...data };
      const { userTypeId, licenseNo, pharmacyName, icNo } = data
      if (parseInt(userTypeId) === 3 && (licenseNo === '' || pharmacyName === '')) {
        return { status: false, message: 'missing name | license No', statusCode: 415 };
      }

      if (parseInt(userTypeId) === 2 && icNo === '') {
        return { status: false, message: 'missing Ic No', statusCode: 415 };
      }

      const { id, status, message, statusCode, error } = await this.repository.User.save(fields)
      return { status, message, statusCode, error };
    } catch (error) {
      throw error;
    }
  }

  async login(data, secret) {
    try {
      const { email, password } = data;

      const user = await this.repository.User.findByEmail(email);
      if (user) {
        if(!user.isValidPassword(password)){
          return { status: false, message: 'Invalid Email/ Password Provided'};
        }
        const token = jwt.sign({ uuid: user.uuid }, secret, { expiresIn: '24h' });
        return { status: true, token };
      } else {
        return { status: false, message: 'Invalid Email Provided'};
      }
    } catch(error) {
      throw error;
    }
  }
}

export default UserService;

import { v4 as uuidv4 } from 'uuid';

import BaseService from './BaseService';

class ProductService extends BaseService {
  constructor(repository) {
    super(repository);
    this.repository = repository;
  }

  async create(data) {
    try {
      const uuid = uuidv4();
      const fields = { uuid, ...data };
      const { id, status, message, statusCode, error } = await this.repository.Product.save(fields)
      return { status, message, statusCode, error };
    } catch (error) {
      throw error;
    }
  }

  async list() {
    try {

      const productsList = await this.repository.Product.listAll();
      if (productsList) {
        return { status: true, list: productsList };
      } else {
        return { status: false, message: 'Invalid Email Provided'};
      }
    } catch(error) {
      throw error;
    }
  }
}

export default ProductService;

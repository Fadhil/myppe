import { v4 as uuidv4 } from 'uuid';

import BaseService from './BaseService';

class InventoryService extends BaseService {
  constructor(repository) {
    super(repository);
    this.repository = repository;
  }

  async create(data, userId) {
    try {
      const uuid = uuidv4();
      const productItem = await this.repository.Product.findByUuid(data.productUuid);
      if (productItem.id) {
        const fields = { uuid, userId, productId: productItem.id, ...data };
        const {  status, message, statusCode, error, item } = await this.repository.Inventory.save(fields, productItem);
        return { status, message, statusCode, error, item };
      } else {
        return { status: 'failed', message: 'something went wrong', statusCode: 200 };
      }
    } catch (error) {
      throw error;
    }
  }

  async list(userId) {
    try {

      const inventoryList = await this.repository.Inventory.listAll(userId);
      if (inventoryList) {
        return { status: true, list: inventoryList };
      } else {
        return { status: false, message: 'Invalid Email Provided'};
      }
    } catch(error) {
      throw error;
    }
  }
}

export default InventoryService;

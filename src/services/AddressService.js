
import BaseService from './BaseService';

class AddressService extends BaseService {
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

  async getAddress(userId) {
    try {
      const address = await this.repository.Address.find(userId);
      return { status: true, data: address };
    } catch(error) {
      throw error;
    }
  }
}

export default AddressService;

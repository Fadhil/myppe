import BaseService from './BaseService';
import UserService from './UserService';
import ProductService from './ProductService';
import InventoryService from './InventoryService';
import AddressService from './AddressService';

class Service {
  constructor(repository, storage) {
    this.repository = repository;
    this.storage = storage;
  }

  registerServices() {
    this.repository.registerRepositories();

    this.BaseService = new BaseService(this.repository);
    this.User = new UserService(this.repository);
    this.Product = new ProductService(this.repository);
    this.Inventory = new InventoryService(this.repository);
    this.Address = new AddressService(this.repository);
  }
}

export default Service;

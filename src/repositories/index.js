import UserRepository from './UserRepository';
import ProductRepository from './ProductRepository';
import InventoryRepository from './InventoryRepository';
import AddressRepository from './AddressRepository';

class Repository {
  constructor(db) {
    this.db = db;
  }

  registerRepositories() {
    // add all your repositories here
    this.User = new UserRepository(this.db);
    this.Product = new ProductRepository(this.db);
    this.Inventory = new InventoryRepository(this.db);
    this.Address = new AddressRepository(this.db);
  }
}

export default Repository;

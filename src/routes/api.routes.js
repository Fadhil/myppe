import BaseRoutes from './base.routes';
import UsersController from '../controllers/UsersController';
import ProductsController from '../controllers/ProductsController';
import InventoriesController from '../controllers/InventoriesController';
import AddressesController from '../controllers/AddressesController';

class ApiRoutes extends BaseRoutes {
  // TO Register Routes this is pattern
  /**
   * 1. endpoint url decleration
   * 2. method associated like (GET, PUT, POST, DELETE, PATCH)
   * 3. controller name
   * 4. method you want to expose from the specific contoller.
   */
  getRoutes() {

    this.addRoute('/register', 'post', UsersController, 'register');
    this.addRoute('/authenticate', 'post', UsersController, 'login');

    return this.routes;
  }

  // Secured router list those required jWT Token Authorization.
  getSecuredRoutes() {

    // common routes for both forntend & backend
    this.addRoute('/me', 'get', UsersController, 'me');
    this.addRoute('/logout', 'get', UsersController, 'logout');

    // admin and pharmacy admin routes
    this.addRoute('/products', 'get', ProductsController, 'list');
    this.addRoute('/product/create', 'post', ProductsController, 'create');
    this.addRoute('/inventoryItems', 'get', InventoriesController, 'list');
    this.addRoute('/inventory/create', 'post', InventoriesController, 'create');
    this.addRoute('/getAddress', 'get', AddressesController, 'getAddress')

    // fornt end customer routes


    return this.routes;
  }
}

export default ApiRoutes;

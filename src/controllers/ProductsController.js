import BaseController from './BaseController';

class ProductsController extends BaseController {

  async list() {
    try {
      const { status, message, error, list } = await this.service.Product.list();
      if(status) {
        this.okResponse({ message, list });
      } else {
        this.errorResponse(200, message, error);
      }
    } catch (error) {
      console.log('Products Error: ', error);
      throw error;
    }
  }

  async create() {
    try {
      const { status, message, error } = await this.service.Product.create(this.body);
      if(status) {
        this.okResponse({ message });
      } else {
        this.errorResponse(400, message, error);
      }
    } catch (error) {
      console.log('Product Error: ', error);
      throw error;
    }
  }

}

export default ProductsController;

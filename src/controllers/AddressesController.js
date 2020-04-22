import BaseController from './BaseController';

class AddressesController extends BaseController {

  async getAddress() {
    try {
      const { id } = this.req.AuthUser;
      const { status, message, error, address } = await this.service.Address.getAddress(id);
      if(status) {
        this.okResponse({ message, address });
      } else {
        this.errorResponse(200, message, error);
      }
    } catch (error) {
      console.log('Inventory Error: ', error);
      throw error;
    }
  }

  async create() {
    try {
      const { id } = this.req.AuthUser;
      const { status, message, error, item } = await this.service.Inventory.create(this.body, id);
      if(status) {
        this.okResponse({ message, item });
      } else {
        this.errorResponse(400, message, error);
      }
    } catch (error) {
      console.log('Inventory Error: ', error);
      throw error;
    }
  }

}

export default AddressesController;

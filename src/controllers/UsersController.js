import BaseController from './BaseController';

class UsersController extends BaseController {

  async register() {
    try {
      const { status, message, error, statusCode } = await this.service.User.register(this.body);
      if(status) {
        this.okResponse({ message });
      } else {
        this.errorResponse(200, message, error, statusCode);
      }
    } catch (error) {
      console.log('Registration Error: ', error);
      throw error;
    }
  }

  async login() {
    try {
      const { JWT_SECRET } = this.constants;
      const { status, message, error, token } = await this.service.User.login(this.body, JWT_SECRET);
      if(status) {
        this.okResponse({ message, token });
      } else {
        this.errorResponse(200, message, error);
      }
    } catch (error) {
      console.log('Registration Error: ', error);
      throw error;
    }
  }

  async me() {
    try {
      const { AuthUser: { uuid, email, name } } = this.req;
      this.okResponse({ user: { uuid, email, name } });
    } catch(error) {
      this.errorResponse(400, message, error);
    }
  }

  async logout() {
    try {
      this.okResponse();
    } catch(error) {
      this.errorResponse(400, message, error);
    }
  }
}

export default UsersController;

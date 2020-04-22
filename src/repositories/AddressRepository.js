
import BaseRepository from './BaseRepository';

class AddressRepository extends BaseRepository {
  constructor(db) {
    super();
    this.address = db.Address;
    this.user = db.User;
  }

  async save(fields) {
    try {
      const { id } = await this.product.create({ ...fields });
      return { status: true, statusCode: 201, message: 'created', id };
    } catch(error) {
      console.log('***** USER REPOSITORY *****', error);
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }

  async find(userId) {
    try {
      const address = await this.address.findOne({
        where: { userId },
        include: [{
          model: this.user
        }]
      });
      return address;
    } catch (error) {
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }

}

export default AddressRepository;

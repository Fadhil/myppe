import BaseRepository from './BaseRepository';

class ProductRepository extends BaseRepository {
  constructor(db) {
    super();
    this.product = db.Product;
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

  async listAll() {
    try {
      const products = await this.product.findAll({
        attributes: ['uuid', 'name']
      });
      return products;
    } catch (error) {
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }

  async findByUuid(uuid) {
    try {
      const product = await this.product.findOne({
        where: { uuid }
      });
      return product;
    } catch (error) {
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }
}

export default ProductRepository;

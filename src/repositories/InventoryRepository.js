import BaseRepository from './BaseRepository';

class InventoryRepository extends BaseRepository {
  constructor(db) {
    super();
    this.inventory = db.Inventory;
    this.product = db.Product;
  }

  async save(fields, { name }) {
    try {
      const { uuid, dailyLimit, totalStock } = await this.inventory.create({ ...fields });
      const newRecord = { uuid, dailyLimit, totalStock, 'Product.name': name };
      return { status: true, statusCode: 201, message: 'created', item: newRecord };
    } catch(error) {
      console.log('***** Inventory REPOSITORY *****', error);
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }

  async listAll(userId) {
    try {
      const items = await this.inventory.findAll({
        raw: true,
        attributes: ['uuid', 'dailyLimit', 'totalStock'],
        where: { userId },
        include: [{
          model: this.product,
          as: 'Product',
          attributes: [ 'uuid', 'name' ]
        }]
      });
      return items;
    } catch (error) {
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }
}

export default InventoryRepository;

import BaseRepository from './BaseRepository';

class UserRepository extends BaseRepository {
  constructor(db) {
    super();
    this.user = db.User;
  }

  async save(fields) {
    try {
      console.log('***** FIELDS DATA *****', fields);
      const { id } = await this.user.create({ ...fields });
      return { status: true, statusCode: 201, message: 'created', id };
    } catch(error) {
      console.log('***** USER REPOSITORY *****', error);
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }

  async findByEmail(email) {
    try {
      const user = await this.user.findOne({
        where: { email }
      });
      return user;
    } catch (error) {
      return { status: false, error, statusCode: 415, message: 'something went wrong' };
    }
  }
}

export default UserRepository;

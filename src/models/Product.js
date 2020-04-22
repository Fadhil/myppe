export default (sequelize, DataTypes) => {
  const Product = sequelize.define(
    'Product',
    {
      id: {
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.BIGINT,
      },
      uuid: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        uinque: true,
      },
      name: {
        type: DataTypes.STRING,
        allowNull: {
          args: false,
          msg: "Name is Required!"
        }
      },
      status: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
        allowNull: {
          args: false,
          msg: 'Pease input a status'
        }
      }
    },
    {
      tableName: 'products',
    }
  );

  return Product;
};

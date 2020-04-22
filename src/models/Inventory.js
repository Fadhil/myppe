export default (sequelize, DataTypes) => {
  const Inventory = sequelize.define(
    'Inventory',
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
      userId: {
        type: DataTypes.BIGINT,
        allowNull: {
          args: false,
          msg: 'User Id is Required!',
        },
        validate: {
          isInt: {
            args: true,
            msg: "userId is Required!"
          }
        }
      },
      productId: {
        type: DataTypes.BIGINT,
        allowNull: {
          args: false,
          msg: 'Product Id is Required!',
        },
        validate: {
          isInt: {
            args: true,
            msg: "ProductId is Required!"
          }
        }
      },
      dailyLimit: {
        type: DataTypes.BIGINT,
        allowNull: {
          args: false,
          msg: 'DailyLimit is Required!',
        },
        validate: {
          isInt: {
            args: true,
            msg: "DailyLimit is Required!"
          }
        }
      },
      totalStock: {
        type: DataTypes.BIGINT,
        allowNull: {
          args: false,
          msg: 'Total Stock is Required!'
        },
        validate: {
          isInt: {
            args: true,
            msg: "Total Stock is Required!"
          }
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
      tableName: 'inventories',
      indexes: [
        {
          uinque: true,
          fields: ['productId', 'userId']
        }
      ]
    }
  );

  Inventory.associate = ({ Product }) => {
    Inventory.belongsTo(Product);
  };

  return Inventory;
};

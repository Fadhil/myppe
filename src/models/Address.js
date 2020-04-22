export default (sequelize, DataTypes) => {
  const Address = sequelize.define(
    'Address',
    {
      id: {
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.BIGINT,
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
      formattedAddress: {
        type: DataTypes.STRING,
        allowNull: {
          args: false,
          msg: 'Formatted Address is Required!'
        }
      },
      location: {
        type: DataTypes.GEOMETRY('POINT'),
        allowNull: {
          args: false,
          msg: 'Location is Required!'
        }
      },
    },
    {
      tableName: 'addresses',
    }
  );

  Address.associate = ({ User }) => {
    Address.belongsTo(User);
  };

  return Address;
};

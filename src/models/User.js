import bcrypt from 'bcrypt';

export default (sequelize, DataTypes) => {
  const User = sequelize.define(
    'User',
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
      userTypeId: {
        type: DataTypes.BIGINT,
        allowNull: false,
        validate: {
          notNull: true
        }
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          is: {
            args: /^[a-zA-Z ]*$/i,
            msg: 'please enter name without sepecial characters'
          }
        }
      },
      pharmacyName: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      email: {
        type: DataTypes.STRING,
        unique: true,
        validate: {
          isEmail: {
            args: true,
            msg: 'please enter valid email'
          }
        }
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          notEmpty: true,
          len: {
            args: [8, 12],
            msg: 'Password length must be in between 8 to 12 characters'
          },
          is: {
            args: /(?=.*[!@#$%^&*])/i,
            msg: "Password must containt atleast 1 special character"
          }
        }
      },
      phone: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          notEmpty: true,
          isNumeric: {
            args: true,
            msg: 'Please enter a valid phone no'
          }
        }
      },
      licenseNo: {
        type: DataTypes.STRING,
      },
      icNo: {
        type: DataTypes.STRING,
        allowNull: true,
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
      tableName: 'users',
    }
  );

  User.beforeCreate(user => {
    const salt = bcrypt.genSaltSync(8);
    user.password = bcrypt.hashSync(user.password, salt)
  });

  User.prototype.isValidPassword = function(password) {
    return bcrypt.compareSync(password, this.password)
  }

  User.associate = ({ Address }) => {
    User.hasOne(Address);
  };


  return User;
};

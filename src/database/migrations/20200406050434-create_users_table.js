module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.BIGINT
      },
      uuid: {
        allowNull: false,
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDv4,
        unique: true
      },
      userTypeId: {
        allowNull: false,
        type: Sequelize.BIGINT
      },
      email: {
        allowNull: false,
        type: Sequelize.STRING,
        unique: true
      },
      password: {
        allowNull: false,
        type: Sequelize.STRING
      },
      name: {
        allowNull: false,
        type: Sequelize.STRING
      },
      pharmacyName: {
        allowNull: true,
        type: Sequelize.STRING
      },
      licenseNo: {
        allowNull: true,
        type: Sequelize.STRING
      },
      icNo: {
        allowNull: true,
        type: Sequelize.STRING
      },
      phone: {
        allowNull: false,
        type: Sequelize.STRING
      },
      status: {
        allowNull: false,
        type: Sequelize.BOOLEAN,
        defaultValue: false
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.NOW
      }
    });
  },

  down: queryInterface => {
    return queryInterface.dropTable('users');
  }
};

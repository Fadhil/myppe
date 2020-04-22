'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('inventories', {
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
      userId: {
        allowNull: false,
        type: Sequelize.BIGINT
      },
      productId: {
        allowNull: false,
        type: Sequelize.BIGINT
      },
      dailyLimit: {
        allowNull: false,
        type: Sequelize.BIGINT
      },
      totalStock: {
        allowNull: false,
        type: Sequelize.BIGINT
      },
      status: {
        allowNull: false,
        type: Sequelize.BOOLEAN,
        defaultValue: true
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
    return queryInterface.dropTable('inventories');
  }
};

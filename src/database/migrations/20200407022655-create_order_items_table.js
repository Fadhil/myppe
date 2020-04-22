'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('orderItems', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.BIGINT
      },
      orderId: {
        allowNull: false,
        type: Sequelize.BIGINT,
        references: {
          model: 'orders',
          key: 'id'
        }
      },
      productId: {
        allowNull: false,
        type: Sequelize.BIGINT
      },
      quantity: {
        allowNull: false,
        type: Sequelize.INTEGER,
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
   return queryInterface.dropTable('orderItems')
  }
};

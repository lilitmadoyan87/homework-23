module.exports = (sequelize, Sequelize) => {
    const Passenger = sequelize.define("passenger", {
        name: Sequelize.STRING,
        phone: Sequelize.STRING
    })
    return Passenger
}

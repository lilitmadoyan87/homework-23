const { Sequelize } = require("sequelize")
const sequelize = new Sequelize("node_homework_23", "root", "", {
    host: "127.0.0.1",
    port: 3306,
    dialect: "mysql"
})

const Train = require("./Train")(sequelize, Sequelize)
const Passenger = require("./Passenger")(sequelize, Sequelize)

Passenger.belongsTo(Train, { onUpdate: "cascade", onDelete: "cascade" })
Train.hasMany(Passenger, { onUpdate: "cascade", onDelete: "cascade" })

sequelize.sync()
module.exports = {sequelize, Train, Passenger}
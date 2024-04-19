module.exports = (sequelize, Sequelize) => {
    const Train = sequelize.define("train", {
        train_number: Sequelize.STRING,
        passengers_count: Sequelize.INTEGER,
        from_country: Sequelize.STRING,
        to_country: Sequelize.STRING,
        start_time: Sequelize.STRING,
        ticket_price: Sequelize.INTEGER
    })
    return Train
}
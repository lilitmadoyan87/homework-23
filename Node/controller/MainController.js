const { Op } = require("sequelize")
const { Train, Passenger } = require("../model")
const { validationResult } = require("express-validator")
const cities = ["Rome", "Florence", "Venice", "Milan", "Siena", "Verona", "Bologna", "Genoa", "Palermo", "Naples", "Turin", "Como", "Pisa", "Lido de Jessolo", "Murano", "Burrano", "Rimini", "Carpi", "Parma", "Ravenna", "Perugia", "Bergamo", "Siracusa", "Pompei", "Sorrento"]

class MainController {
    static async trainsPage(req, res) {
        const train = await Train.findAll()
        res.render("trains", { train, city: cities })
    }

    static async passengersPage(req, res) {
        const data = await Passenger.findAll(
            { include: [Train] }
        )
        res.render("passengers", { data })
    }

    static async addTrainPage(req, res) {
        res.render("addTrain", { city: cities, error: req.session.trainError })
    }

    static async addPassengerPage(req, res) {
        const train = await Train.findAll()
        res.render("addPassenger", { train, error: req.session.passengerError })
    }

    static async search(req, res) {
        const { from_country, to_country } = req.query
        const train = await Train.findAll(
            {
                where: {
                    to_country,
                    from_country
                },
                include: [Passenger]
            })
        console.log(train);
         const obj = []
        for (let e in train) {
            if (train[e].passengers_count > train[e].passengers.length) {
                obj.push(train[e])
            }
        }
         res.render("trains", { train: obj, error: req.session.passengerError, city: cities })
    }

    static async addTrain(req, res) {
        console.log(req.body);
        const errors = validationResult(req)
        if (!errors.isEmpty()) {
            const obj = {}
            for (let e in errors.errors) {
                if (obj[errors.errors[e].path] != errors.errors[e].path) {
                    obj[errors.errors[e].path] = errors.errors[e].msg
                }
            }
            req.session.trainError = obj
        } else {
            req.session.trainError = undefined
            await Train.create(req.body)
        }
        res.redirect("/addTrain")
    }

    static async addPassenger(req, res) {
        const errors = validationResult(req)
        if (!errors.isEmpty()) {
            const obj = {}
            for (let e in errors.errors) {
                if (obj[errors.errors[e].path] != errors.errors[e].path) {
                    obj[errors.errors[e].path] = errors.errors[e].msg
                }
            }
            req.session.passengerError = obj
        } else {
            req.session.passengerError = undefined
            await Passenger.create(req.body)
        }
        res.redirect("/addPassenger")
    }
}

module.exports = { MainController }
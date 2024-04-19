const { MainController } = require("../controller/MainController")
const router = require("express").Router()
const { body } = require("express-validator")
const { Train, Passenger } = require("../model")

router.get("/", MainController.trainsPage)
router.get("/passengers", MainController.passengersPage)
router.get("/addTrain", MainController.addTrainPage)
router.get("/addPassenger", MainController.addPassengerPage)
router.get("/search/?", MainController.search)

router.post("/addTrain", [
    body("train_number").trim().notEmpty().withMessage("Enter train number")
        .custom(async (value, { req }) => {
            const data = await Train.findOne({
                where: { train_number: value }
            })
            if (data) {
                throw new Error("Train already exists")
            }
        }),
    body("passengers_count").trim()
        .notEmpty().withMessage("Enter data")
        .isNumeric().withMessage("Enter numeric data"),
    body("from_country").trim()
        .notEmpty().withMessage("Enter data")
        .custom((value, { req }) => {
            if (value == req.body.to_country) {
                throw new Error("Can`t be the same as arriving city")
            } else {
                return true
            }
        }),
    body("to_country").trim()
        .notEmpty().withMessage("Enter data")
        .custom((value, { req }) => {
            if (value == req.body.from_country) {
                throw new Error("Can`t be the same as departure city")
            } else {
                return true
            }
        }),
    body("start_time").trim()
        .notEmpty().withMessage("Enter time")
        .isDate().withMessage("Enter yyyy/mm/dd format"),
    body("ticket_price").trim()
        .notEmpty().withMessage("Enter data")
        .isNumeric().withMessage("Enter numeric data")
], MainController.addTrain)

router.post("/addPassenger", [
    body("name").trim().notEmpty().withMessage("Enter name"),
    body("phone").trim()
        .notEmpty().withMessage("Enter phone"),
    body("trainId").trim()
        .notEmpty().withMessage("Enter phone")
        .custom(async (value, { req }) => {
            const data = await Train.findOne(
                {
                    where: { id: value }, 
                    include: [Passenger]

                })
            if (data.passengers.length >= data.passengers_count) {
                throw new Error("No available seats")
            } else {
                return true
            }
        })
], MainController.addPassenger)

module.exports = { router }
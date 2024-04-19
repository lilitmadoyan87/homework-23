const express=require("express")
const { router } = require("./router")
const app = express()
app.set("view engine", "hbs")
require("hbs").registerPartials(__dirname + "\\views\\component")

app.use(express.json())
app.use(express.urlencoded({extended: false}))
app.use(express.static("public"))
app.use(require("express-session")({
    secret: "Travel",
    resave: false,
    saveUninitialized: true
}))

app.use("/", router)
app.listen(8080)
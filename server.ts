import express from "express"

const app = express()

app.get('/', (req, res) => {
    res.json({
        message: "Vamos começar"
    })
})

app.listen(process.env.PORT, () => {
    console.log('Server up')
})
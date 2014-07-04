Parser     = require './parser'
Prettifier = require './prettifier'
UNITS      = require('./enums').UNITS

module.exports =
    parse: (args...) -> new Parser args...
    prettify: (date, args...) ->
        date = new Parser date
        # console.log 'date', date
        (new Prettifier date).toString()
    UNITS: UNITS

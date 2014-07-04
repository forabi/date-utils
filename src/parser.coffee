UNITS = require('./enums').UNITS

class Parser
    SEC = 1000
    MIN = 60 * SEC
    HOUR = 60 * MIN
    DAY = 24 * HOUR
    WEEK =  7 * DAY
    MONTH = 30 * DAY
    YEAR = 365 * DAY
    abs = Math.abs
    rnd = Math.round

    constructor: (@date, @relativeTo = new Date) ->
        return @parse()

    parse: ->
        rem = diff = abs @relativeTo - @date
        # console.log "Difference #{diff}"
        parsed = []
        finished = no
        if diff is 0 then parsed.push res = [ 0, UNITS.SEC ]
        else
            while rem > 0 and not finished
                # console.log "Remaining: #{rem}"
                res = switch
                    when rem >= YEAR then [ rem, UNITS.YEAR, YEAR ]
                    when rem >= MONTH then  [ rem, UNITS.MONTH, MONTH ]
                    when rem >= WEEK then [ rem, UNITS.WEEK, WEEK ]
                    when rem >= DAY then [ rem, UNITS.DAY, DAY ]
                    when rem >= HOUR then [ rem, UNITS.HOUR, HOUR ]
                    when rem >= MIN then [ rem, UNITS.MIN, MIN ]
                    else
                        finished = yes
                        [ rem, UNITS.SEC, SEC ]
                rem = diff % res[2]
                res[0] = rnd res[0]/res[2]
                parsed.push res[0..1]
        parsed

module.exports = Parser

class DateParser
    SEC = 1000
    MIN = 60 * SEC
    HOUR = 60 * MIN
    DAY = 24 * HOUR
    WEEK =  7 * DAY
    MONTH = 30 * DAY
    YEAR = 365 * DAY
    abs = Math.abs
    rnd = Math.round
    constructor: (date = new Date, relativeTo = new Date) ->
        @date = new Date date
        @relativeTo = new Date relativeTo
        return @parse()
    difference: (from = @relativeTo) ->
        abs diff = from - @date.getTime()
    parse: ->
        rem = diff = @difference()
        console.log "Difference #{diff}"
        parsed = []
        finished = no
        while rem > 0 and not finished
            console.log "Remaining: #{rem}"
            res = switch
                when rem >= YEAR then [ rem, 'y', YEAR ]
                when rem >= MONTH then  [ rem, 'M', MONTH ]
                when rem >= WEEK then [ rem, 'w', WEEK ]
                when rem >= DAY then [ rem, 'd', DAY ]
                when rem >= HOUR then [ rem, 'h', HOUR ]
                when rem >= MIN then [ rem, 'm', MIN ]
                else
                    finished = yes
                    [ rem, 's', SEC ]
            rem = diff % res[2]
            res[0] = rnd res[0]/res[2]
            parsed.push res[0..1]
        parsed

module.exports = DateParser
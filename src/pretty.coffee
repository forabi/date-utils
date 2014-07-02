class PrettyDate
    defaults = [
        [0, 'second']
        [0, 'minute']
        [0, 'hour']
        [0, 'day']
        [0, 'week']
        [0, 'month']
        [0, 'year']
    ]
    approx =
        second: 45
        minute: 45
        hour: 20
        day: 6
        week: 3.5
        month: 11.1
    constructor: ({
        @parsed, @precision, @strict
        } = {
            parsed: new Date()
            precision: 'hour'
            strict: no
        }) ->
    context:
        future: no
    approximate: ->
        r = []
        for key, val of @parsed
            r.push val
            if val[1] is @precision then break

        r.reverse()
        for v, i in r when i < r.length - 1
            if v[0] >= approx[v[1]]
                @aligned = yes
                r[i][0] = 0
                r[i+1][0] += 1

        r.reverse()
    toString: (@locale = 'en') ->
        array = if not @strict then @approximate() else @parsed
        lang = require("./locales/#{@locale}")(@context)
        n = o[0]
        array.map (o) -> lang[str][lang.pluralize(n)].replace '${n}', n
        # delete array[i] for o, i in array when o[0] is 0
        # array
        # .join(' ')
module.exports = PrettyDate
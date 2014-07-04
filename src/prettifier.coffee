HUMAN = require('./enums').HUMAN
UNITS = require('./enums').UNITS

langs =
    en: require("./locales/en")
    ar: require("./locales/ar")

class Prettifier
    defaults = [
        [0, UNITS.SEC]
    ]

    approx =
        second: 45
        minute: 45
        hour: 20
        day: 6
        week: 3.5
        month: 11.1

    constructor: (@parsed, @precision = UNITS.HOUR, @strict = no) ->

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
        # console.log '@parsed', @parsed
        array = if not @strict then @approximate() else @parsed
        # console.log 'prettifing array', array
        lang = langs[@locale](@context =
            relation: 'past' # TODO: detect relation
            )

        # console.log 'locale is', @locale
        # console.log 'context is', @context

        array = array.filter (fragment, i) ->
            # console.log "filtering fragment #{i}", fragment
            i is 0 or fragment[0] isnt 0

        # console.log 'removed 0 values', array

        array = array.map (fragment) ->
            # console.log 'mapping fragment', fragment
            n = fragment[0]
            human = HUMAN[fragment[1]]
            lang[human][lang.pluralize(n)].replace('${n}', n)

        array = array.filter (fragment) -> fragment[0] isnt ''

        lang[@context.relation].replace('${pretty}', lang.join array)

module.exports = Prettifier

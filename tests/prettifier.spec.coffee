Parser     = require '../src/parser'
Prettifier = require '../src/prettifier'

describe 'PrettyDate', ->
    it 'should handle past dates', ->
        date = new Date
        date.setFullYear(date.getFullYear() - 1)
        parsed = new Parser date
        pretty = new Prettifier parsed

        expect(pretty.toString('en')).toMatch '1 year ago'

    it 'should handle current date', ->
        date = new Date
        parsed = new Parser date
        pretty = new Prettifier parsed

        expect(pretty.toString('en')).toMatch '0 seconds ago'

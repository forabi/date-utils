DateParser = require '../src/parser'
PrettyDate = require '../src/pretty'

# s = [ [ 4, 'week' ], [ 2, 'day' ], [ 23, 'hour' ], [ 59, 'minute' ], [ 45, 'second' ] ]

describe 'PrettyDate', ->
    it 'should have i18n support', ->
        beforeEach ->
            date = new Date()
            date.setYear date.getYear() - 1
            date = new DateParser(date)
            @instance = new PrettyDate(parsed: date)
        expect(@instance.toString('ar')).toMatch 'منذ سنة'

    it 'should handle past dates', ->
        beforeEach ->
            date = new Date()
            date.setYear date.getYear() - 1
            date = new DateParser(date)
            @instance = new PrettyDate(parsed: date)
        expect(@instance.toString('en')).toMatch '1 year ago'

    it 'should handle future dates', ->
        beforeEach ->
            date = new Date()
            date.setYear date.getYear() + 1
            date = new DateParser(date)
            @instance = new PrettyDate(parsed: date)

        expect(@instance.toString('en')).toMatch 'within 1 year'

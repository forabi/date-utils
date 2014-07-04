UNITS = require('../src/enums').UNITS
Parser = require '../src/parser'

describe 'Parser', ->
    describe 'Basic usage', ->
        describe 'Seconds', ->
            describe '0 seconds', ->
                it 'should return 0 seconds', ->
                    relativeTo = new Date()
                    date = relativeTo
                    parser = new Parser date, relativeTo
                    expect(parser).toEqual([[0, UNITS.SEC]])

            describe '10 seconds', ->
                it 'should return 10 seconds', ->
                    relativeTo = new Date()
                    relativeTo.setSeconds(50)
                    date = new Date()
                    date.setSeconds(40)
                    parser = new Parser date, relativeTo
                    expect(parser).toEqual([[10, UNITS.SEC]])

            describe '60 seconds', ->
                it 'should return 1 minute', ->
                    relativeTo = new Date()
                    relativeTo.setSeconds(60)
                    date = new Date()
                    date.setSeconds(0)
                    parser = new Parser date, relativeTo
                    expect(parser).toEqual([[1, UNITS.MIN]])

        describe 'Two days', ->
            beforeEach ->
                @date = new Date '2014-04-02'
                @relativeTo = new Date '2014-04-04'

            it 'should return 2 days', ->
                parser = new Parser @date, @relativeTo
                expect(parser).toEqual([[2, UNITS.DAY]])

        describe 'One week', ->
            beforeEach ->
                @date = new Date '2014-03-28'
                @relativeTo = new Date '2014-04-04'

            it 'should return 1 week', ->
                parser = new Parser @date, @relativeTo
                expect(parser).toEqual([[1, UNITS.WEEK]])

        describe 'One month (exactly 30 days)', ->
            beforeEach ->
                @date = new Date '2014-03-05'
                @relativeTo = new Date '2014-04-04'

            it 'should return 1 month', ->
                parser = new Parser @date, @relativeTo
                expect(parser).toEqual([[1, UNITS.MONTH]])

        describe 'One year', ->
            it 'should return 1 year', ->
                @date = new Date '2013-04-04'
                @relativeTo = new Date '2014-04-04'
                parser = new Parser @date, @relativeTo
                expect(parser).toEqual([[1, UNITS.YEAR]])

            it 'should return 1 year', ->
                @date = new Date
                @relativeTo = new Date(@date.getTime())
                @date.setFullYear @date.getFullYear() - 1
                parser = new Parser @date
                expect(parser).toEqual([[1, UNITS.YEAR]])


        describe 'Multiple time units', ->
            it 'should return 1 week and 2 days', ->
                date = new Date '2014-03-26'
                relativeTo = new Date '2014-04-04'
                parser = new Parser date, relativeTo
                expect(parser).toEqual([[1, UNITS.WEEK], [2, UNITS.DAY]])

            it 'should return 1 year, 1 week and 3 days', ->
                date = new Date '2013-03-26'
                relativeTo = new Date '2014-04-04'
                parser = new Parser date, relativeTo
                expect(parser).toEqual([[1, UNITS.YEAR], [1, UNITS.WEEK], [3, UNITS.DAY]])

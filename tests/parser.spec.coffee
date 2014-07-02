DateParser = require '../src/parser'

describe 'DateParser', ->
    describe 'Basic usage', ->
        describe 'Two days', ->
            beforeEach ->
                @date = '2014-04-02'
                @relativeTo = '2014-04-04'

            it 'should return 2 days ago', ->
                parser = new DateParser @date, @relativeTo
                expect(parser).toEqual([[2, 'd']])

        describe 'One week', ->
            beforeEach ->
                @date = '2014-03-28'
                @relativeTo = '2014-04-04'

            it 'should return 1 week ago', ->
                parser = new DateParser @date, @relativeTo
                expect(parser).toEqual([[1, 'w']])

        describe 'One year', ->
            beforeEach ->
                @date = '2013-04-04'
                @relativeTo = '2014-04-04'

            it 'should return 1 year ago', ->
                parser = new DateParser @date, @relativeTo
                expect(parser).toEqual([[1, 'y']])


        describe 'Multiple time units', ->
            it 'should return 1 week and 2 days ago', ->
                date = '2014-03-26'
                relativeTo = '2014-04-04'
                parser = new DateParser date, relativeTo
                expect(parser).toEqual([[1, 'w'], [2, 'd']])

            it 'should return 1 year, 1 week and 3 days ago', ->
                date = '2013-03-26'
                relativeTo = '2014-04-04'
                parser = new DateParser date, relativeTo
                expect(parser).toEqual([[1, 'y'], [1, 'w'], [3, 'd']])
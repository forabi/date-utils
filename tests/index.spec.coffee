DateUtils = require '../src/index'

describe 'DateUtils', ->
    describe 'Prettify', ->
        it 'should return a relative date string', ->
            pretty = DateUtils.prettify new Date '2014-07-02'
            expect(pretty).toMatch /.+ ago/i

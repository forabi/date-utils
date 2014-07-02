module.exports = (context) ->
    pluralize: (n) ->
        n is 1 ? 0 : 1

    past: '${pretty} ago'
    future: 'within ${pretty}'
    now: 'just now'

    second: [
        '1 second'
        '${n} seconds'
    ]

    minute: [
        '1 minute'
        '${n} minutes'
    ]

    hour: [
        '1 hour'
        '${n} hours'
    ]

    day: [
        '1 day'
        '${n} days'
    ]

    week: [
        '1 week'
        '${n} weeks'
    ]

    month: [
        '1 month'
        '${n} months'
    ]

    year: [
        '1 year'
        '${n} years'
    ]
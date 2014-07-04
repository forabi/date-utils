module.exports = (context) ->
    pluralize: (n) ->
        if n is 1 then 0 else 1

    join: (array) ->
        if array.length < 2 then array.join ''
        else array[0..array.length - 2].join(', ') + " and #{array[array.length - 1]}"


    past: '${pretty} ago'
    future: 'in ${pretty}'
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
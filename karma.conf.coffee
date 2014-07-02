module.exports = (config) ->
  config.set
    frameworks: [ 'jasmine', 'browserify' ]
    browsers: [
        # 'Chrome'
        # 'Firefox'
        'PhantomJS'
        ]

    plugins: [
        'karma-browserify'
        'karma-coffee-preprocessor'
        # 'karma-chrome-launcher'
        # 'karma-firefox-launcher'
        'karma-phantomjs-launcher'
        'karma-jasmine'
    ]

    preprocessors:
        'tests/*': ['browserify']

    coffeePreprocessor:
        # options passed to the coffee compiler
        options:
            bare: true,
            sourceMap: false

        transformPath: (path) -> path.replace /\.coffee$/, '.js'

     browserify:
        extensions: ['.coffee']
        transform: ['coffeeify']
        watch: true   # Watches dependencies only (Karma watches the tests)
        debug: true   # Adds source maps to bundle

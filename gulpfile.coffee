gulp            = require 'gulp'
gutil           = require 'gulp-util'
_               = require 'lodash'


plugins = (require 'gulp-load-plugins')()

config = _.defaults gutil.env,
    env: if gutil.env.production then 'production' else 'development'
    src:
        coffee: ['date-utils.coffee']
        tests: ['*.coffee']
    watch:
        coffee: ['*.coffee']

if config.env isnt 'production'
    config = _.defaults config,
        lint: yes
        sourceMaps: yes

config.dest = "dist/#{config.env}"

try fs.mkdirSync cofig.dest

gulp.task 'watch', ->
    # Something

gulp.task 'clean', ->
    gulp.src ['**/*', '!.gitignore'], cwd: config.dest
    .pipe plugins.clean()

gulp.task 'coffee', ->
    gulp.src config.src.coffee, cwd: 'src'
    .pipe (if config.lint then plugins.coffeelint() else gutil.noop())
    .pipe (if config.lint then plugins.coffeelint.reporter() else gutil.noop())
    .pipe plugins.coffee bare: yes, sourceMap: (yes if config.env isnt 'production')
    .pipe gulp.dest "#{config.dest}"

gulp.task 'test', ->
    gulp.src config.src.tests, cwd: 'tests'
    .pipe plugins.karma action: 'run', configFile: 'karma.conf.coffee'
    .on 'error', (err) -> throw err

gulp.task 'default', ['build']
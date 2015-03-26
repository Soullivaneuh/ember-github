gulp      = require 'gulp'
gutil     = require 'gulp-util'
bower     = require 'gulp-bower'
coffee    = require 'gulp-coffee'
concat    = require 'gulp-concat'
uglify    = require 'gulp-uglify'
compiler  = require './bower_components/ember/ember-template-compiler.js'
htmlbars  = require 'gulp-htmlbars-compiler'
watch     = require 'gulp-watch'
connect   = require 'gulp-connect'

sources =
  coffee    : 'app/**/*.coffee'
  templates : 'app/templates/**/*.hbs'

destinations =
  js : 'dist/js'
  bower: 'dist/lib'

livereloadWatchFiles = [
  destinations.js + '/**/*.js'
  destinations.bower + '**/*'
  'dist/index.html'
]

gulp.task 'bower', ->
  bower { cmd: 'update' }
    .pipe gulp.dest destinations.bower
    .pipe connect.reload()

gulp.task 'js', ->
  gulp.src sources.coffee
    .pipe coffee { bare: true }
    .on 'error', gutil.log
    .pipe concat 'app.js'
#    .pipe uglify()
    .pipe gulp.dest destinations.js

gulp.task 'templates', ->
  gulp.src sources.templates
    .pipe htmlbars { compiler: compiler }
    .on 'error', gutil.log
    .pipe uglify()
    .pipe concat 'templates.js'
    .pipe gulp.dest destinations.js

gulp.task 'livereload', ->
  gulp.src livereloadWatchFiles
    .pipe watch(livereloadWatchFiles)
    .pipe connect.reload()

gulp.task 'webserver', ->
  connect.server
    root: 'dist'
    livereload: true

gulp.task 'watch', ->
  gulp.watch sources.coffee, ['js']
  gulp.watch sources.templates, ['templates']
  gulp.watch 'bower.json', ['bower']

gulp.task 'build', ['bower', 'js', 'templates']
gulp.task 'default', ['build', 'webserver', 'livereload', 'watch']

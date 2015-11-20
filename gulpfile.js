var gulp = require('gulp');
var browserify = require('gulp-browserify');
var concat = require('gulp-concat');
var coffee = require('gulp-coffee');

gulp.task('browser', function () {
  return gulp.src('./fitty.coffee', { read: false })
             .pipe(browserify({ transform: ['coffeeify'], extensions: ['.coffee'] }))
             .pipe(concat('fitty.js'))
             .pipe(gulp.dest('./dist'));
});

gulp.task('default', function () {
  gulp.run('browser');
});

var gulp = require('gulp');
var browserify = require('gulp-browserify');
var concat = require('gulp-concat');
var mocha = require('gulp-mocha');

gulp.task('build', function () {
  return gulp.src('fitty.js', { read: false })
             .pipe(browserify({ global: true, transform: ['coffeeify'], extensions: ['.coffee'] }))
             .pipe(concat('fitty.js'))
             .pipe(gulp.dest('./dist'));
});

gulp.task('watch', function () {
  var bundler = watchify('fitty.coffee');

  // Optionally, you can apply transforms
  // and other configuration options on the
  // bundler just as you would with browserify
  bundler.transform('brfs')

  bundler.on('update', rebundle)

  function rebundle () {
    return bundler.bundle()
      .pipe(source('bundle.js'))
      .pipe(gulp.dest('./dist'))
  }

  return rebundle()
});

gulp.task('test', function() {
	gulp.src('test.coffee', { read: false })
             .pipe(browserify({ global: true, transform: ['coffeeify'], extensions: ['.coffee'] }))
             //.pipe(concat('test.js'))
        	 .pipe(mocha({reporter: 'nyan'}));
});

gulp.task('default', function () {
  gulp.run('build');
});


/*
var gulp = require('gulp');

gulp.task('default', function() {
  // place code for your default task here
});

*/ 


/*
var gulp = require('gulp'),
    less = require('gulp-less'),
    //livereload = require('gulp-livereload'),
    browserSync = require('browser-sync');
    watch = require('gulp-watch');

gulp.task('less', function() {
   gulp.src('less/*.less')
      .pipe(watch())
      .pipe(less())
      .pipe(gulp.dest('css'))
      .pipe(livereload());
});
*/

var gulp = require('gulp'),
    less = require('gulp-less'),
    livereload = require('gulp-livereload'),
    watch = require('gulp-watch');

gulp.task('less', function() {
   gulp.src('less/*.less')
      .pipe(watch())
      .pipe(less())
      .pipe(gulp.dest('css'))
      .pipe(livereload());
});


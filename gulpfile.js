var browserSync = require('browser-sync');
var gulp = require('gulp');

// define source of sass
var src = ["./source/assets/stylesheets/**/*.sass", "./source/assets/stylesheets/**/*.scss"]

gulp.task('default', function() {

    browserSync.init({
      files: src,
      proxy: "localhost:4567",
      notify: false
    });

});

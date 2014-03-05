module.exports = function(grunt) {
    grunt.initConfig({
        less: {
            original: {
                options: {
                    cleancss: false,
                    report: 'min'
                },
                files: {
                    // target.css file: source.less file
                    "css/fabrique.css": "less/fabrique.less"
                }
            },
            minify: {
                options: {
                    cleancss: true,
                    report: 'min'
                },
                files: {
                    "css/fabrique.min.css": "less/fabrique.less"
                }
            }
        },
        watch: {
            styles: {
                // Which files to watch (all .less files recursively in the less directory)
                files: ['less/*.less'],
                tasks: ['less'],
                options: {
                    nospawn: true
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch']);
};

use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Template::Plugin::TallyMarks',
    AUTHOR           => q{E. Choroba <choroba@cpan.org>},
    VERSION_FROM     => 'lib/Template/Plugin/TallyMarks.pm',
    ABSTRACT_FROM    => 'lib/Template/Plugin/TallyMarks.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    META_MERGE       => {
        resources => {
            repository => 'https://github.com/choroba/template-plugin-tallymarks'
        },
        provides  => {
            'Template::Plugin::TallyMarks' => {
                file    => 'lib/Template/Plugin/TallyMarks.pm',
                version => 0.01,
            },
        },
    },
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        Template => 0,
        'Template::Plugin::Filter' => 0,
    },
    macro => { TARFLAGS => '--format=ustar -cvf' },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Template-Plugin-TallyMarks-*' },
);

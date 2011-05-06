use inc::Module::Install;
all_from "lib/Noritama.pm";

license 'unknown';
author  'unknown';

tests 't/*.t t/*/*.t t/*/*/*.t';
requires(
    'Amon2'                           => '2.32',
    'Text::Xslate'                    => 0,
    'Text::Xslate::Bridge::TT2Like'   => 0,
    'Plack::Middleware::ReverseProxy' => 0,
    'HTML::FillInForm::Lite'          => 0,
    'Time::Piece'                     => 0,
    'Teng'                            => 0,
);
recursive_author_tests('xt');

WriteAll;

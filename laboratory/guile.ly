% http://lilypond.org/doc/v2.12/Documentation/devel/contrib-guide/Debugging-LilyPond

#(module-define! (resolve-module '(guile-user))
    'lilypond-module (current-module))

#(top-repl)

% guile> (set-current-module lilypond-module)
% ...
% guile> (quit)

% Useful:
%
% (use-modules (ice-9 readline))
% (activate-readline)

% 295
% Wohl denen, die da wandeln
% Text: cornelius Becker 1602
% Melodie und Satz: Heinrich Schütz 1661

\version "2.24.0"

%#(set-default-paper-size "a5")

\paper  {
  myStaffSize = #18
  #(define fonts
    (make-pango-font-tree "Minion Pro"
     "Myriad Pro"
     "Luxi Mono"
     (/ myStaffSize 20)))
}

% No 'Music engraving by LilyPond ...'
\header {
  tagline = ##f
  %title = "Wohl denen, die da wandeln"
}

\layout {
  % Don't outdent after first line
  indent = 0\in

  % Don't count the bar numbers when breaking scores
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

divisioMinima = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-minima

  % Workaround: add padding.  Correct fix would be spacing engine handle this.
  \once \override BreathingSign.extra-X-extent = #'(-1.0 . 0)

  \breathe
}

\score {
<<
  \relative c' {
    \key g \major
    \time 4/4
    \repeat volta 2
    { \partial 4 d4 g a b d c2 b4 \divisioMinima
      a d a b a8 g8 a2. }
    a4 a a b a g a fis \divisioMinima
    e g a b c b2 a2 \divisioMinima
    d2 c4 a b2 a g2.
    \bar "|."
  }
  \addlyrics {
    \set stanza = "1 "
    Wohl de -- nen, die da wan -- deln vor
    Gott in Hei -- lig -- _ keit,
  }
  \addlyrics {
    nach sei -- nem Wor -- te han -- deln und
    le -- ben al -- le -- _ zeit; die recht von Her -- zen
    su -- chen Gott und sei -- ne Zeug -- niss’
    hal -- ten, sind stets bei ihm in Gnad.
  }
>>
\layout {}
\midi {}
}


%\markup {
%  \hspace #0.1
%  \column {
%    % eigentlich Vers 4
%    \line {
%      \bold "2" \hspace #0.4
%      \column {
%        "Dein Wort, Herr, nicht vergehet,"
%        "es bleibet ewiglich,"
%        "so weit der Himmel gehet,"
%        "der stets beweget sich;"
%        "dein Wahrheit bleibt zu aller Zeit"
%        "gleichwie der Grund der Erden,"
%        "durch deine Hand bereit’."
%      }
%    }
%  }
%}

%\markup{
%  \bold "2" \hspace #0.4 % Eigentlich Vers 4
%  \wordwrap-string "
%  Dein Wort, Herr, nicht vergehet, /
%  es bleibet ewiglich, /
%  so weit der Himmel gehet, /
%  der stets beweget sich; /
%  dein Wahrheit bleibt zu aller Zeit /
%  gleichwie der Grund der Erden, /
%  durch deine Hand bereit’."
%}

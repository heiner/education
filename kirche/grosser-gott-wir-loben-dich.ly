% 331
% Großer Gott, wir loben dich
% Text: Ignaz Franz 1768 nach dem >>Te Deum laudamuse<< 4. Jh.
% Melodie: Lüneburg 1668, Wien um 1776, Leipzig 1819

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
  %title = "Großer Gott, wir loben dich"
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

\score {
<<
  \relative f' {
    \key f \major
    \time 3/4
    \repeat volta 2
    { f2 f4  f( e) f  g( a) g  f2 r4
    a2 a4 a( g) f c'( bes) a a g r4 }
    g2 a4 bes2 g4 a2 bes4 c2 r4
    d2 d4 c( bes) a bes( a) g f2. \bar "|."
  }
  \addlyrics {
    Gro -- ßer Gott, wir lo -- ben dich;
    Herr, wir prei -- sen dei -- ne St -- ärke.
  }
  \addlyrics {
     Vor dir neigt die Er -- de sich und be -- wun -- dert
     dein -- ne Wer -- ke. Wie du warst vor al -- ler
     Zeit, so bleibst du in E -- wig -- keit.
  }
>>
\layout {}
\midi {}
}

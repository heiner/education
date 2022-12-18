% 321
% Nun danket alle Gott
% Text und Melodie: Martin Rinckart (um 1630) 1636
% (Melodiefassung nach Johann Crüger 1647)

\version "2.12.3"

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
  %title = \markup \medium "Nun danket alle Gott"
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
  \relative c'' {
    \key es \major
    \time 4/4
    \repeat volta 2
    { \partial 4 bes4 bes bes c c bes2 r4
    g4 as g f g f2 es4 }
    f4 f f g g f2 r4
    f4 g bes bes a bes2 r4
    bes4 c4 bes4 as4 g as2 r4
    g4 f g f f es2.
    \bar "|."
  }
  \addlyrics {
    \set stanza = "1 "
    Nun dan -- ket al -- le Gott mit Her -- zen,
    Mund und Hän -- den,
  }
  \addlyrics {
    der gro -- ße Din -- ge tut an uns und al -- len
    En -- den, der uns von Mut -- ter -- leib und
    Kin -- des -- bei -- nen an un -- zäh -- lig viel zu --
    gut bis hier -- her hat ge -- tan.
  }
>>
\layout {}
\midi {}
}

%\markup {
%  \fill-line {
%    \hspace #0.1 % moves the column off the left margin;
%        % can be removed if space on the page is tight
%     \column {
%      \line { \bold "2" \hspace #0.4
%        \column {
%          "Der ewig reiche Gott"
%          "woll uns in unserm Leben"
%          "ein immer fröhlich Herz"
%          "und edlen Frieden geben"
%          "und uns in seiner Gnad"
%          "erhalten fort und fort"
%          "und uns aus aller Not"
%          "erlösen hier und dort."
%        }
%      }
%    }
%    \hspace #0.1  % adds horizontal spacing between columns;
%        % if they are still too close, add more " " pairs
%        % until the result looks good
%     \column {
%      \line { \bold "3" \hspace #0.4
%        \column {
%          "Lob, Ehr und Preis sei Gott,"
%          "dem Vater und dem Sohne"
%          "und Gott dem Heilgen Geist"
%          "im höchsten Himmelsthrone,"
%          "ihm, dem dreiein’gen Gott,"
%          "wie es im Anfang war"
%          "und ist und bleiben wird"
%          "so jetzt und immerdar."
%        }
%      }
%    }
%  \hspace #0.1 % gives some extra space on the right margin;
%      % can be removed if page space is tight
%  }
%}

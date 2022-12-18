% 316
% Lobe den Herren, den mächtigen König
% Text: Joachim Neander 1680, ökumenische Fassung 1973
% Melodie: 17. Jh.; geistlich Stralsund 1665, Halle 1741

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
  %title = "Lobe den Herren, den mächtigen König"
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
    \key f \major
    \time 9/4
    \repeat volta 2
    { \partial 4*3 f4 f c' a4. g8 f4 e4 d c d e f g2. f2. }
    c'4 c c d2. \divisioMinima a4 bes c c4. bes8 a4 g2. \divisioMinima
    c,4 d e f g a g2. f2. \bar "|."
  }
  \addlyrics {
    \set stanza = "1 "
    Lo -- be den Her -- ren, den mäch -- ti -- gen Kö -- nig
    der Eh -- ren,
  }
  \addlyrics{
   lob ihn, o See -- le, ver -- eint mit den himm -- li -- schen
   Chö -- ren. Kom -- met zu -- hauf, Psal -- ter und Har -- fe,
   wacht auf, las -- set den Lob -- ge -- sang hö -- ren!
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
%          "Lobe den Herren,"
%          "der alles so herrlich regieret,"
%          "der dich auf Adelers"
%          "Fittichen sicher geführet,"
%          "der dich erhält,"
%          "wie es dir selber gefällt;"
%          "hast du nicht dieses verspüret?"
%        }
%      }
%      \hspace #0.1 % adds vertical spacing between verses
%      \line { \bold "3" \hspace #0.4
%        \column {
%          "Lobe den Herren,"
%          "der künstlich und fein dich bereitet,"
%          "der dir Gesundheit"
%          "verliehen, dich freundlich geleitet."
%          "In wieviel Not"
%          "hat nicht der gnädige Gott"
%          "über dir Flügel gebreitet!"
%        }
%      }
%    }
%    \hspace #0.1  % adds horizontal spacing between columns;
%        % if they are still too close, add more " " pairs
%        % until the result looks good
%     \column {
%      \line { \bold "4" \hspace #0.4
%        \column {
%          "Lobe den Herren,"
%          "der deinen Stand sichtbar gesegnet,"
%          "der aus dem Himmel"
%          "mit Strömen der Liebe geregnet."
%          "denke daran,"
%          "was der Allmächtige kann,"
%          "der dir mit Liebe begegnet."
%        }
%      }
%      \hspace #0.1 % adds vertical spacing between verses
%      \line { \bold "5" \hspace #0.4
%        \column {
%          "Lobe den Herren,"
%          "was in mir ist, lobe den Namen."
%          "Lob ihn mit allen,"
%          "die seine Verheißung bekamen."
%          "Er ist dein Licht,"
%          "Seele, vergiß es ja nicht."
%          "Lob ihn in Ewigkeit. Amen."
%        }
%      }
%    }
%  \hspace #0.1 % gives some extra space on the right margin;
%      % can be removed if page space is tight
%  }
%}

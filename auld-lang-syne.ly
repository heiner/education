% Auld Lang Syne
% abgeschrieben von http://de.wikibooks.org/wiki/Liederbuch:_Auld_Lang_Syne

\version "2.24.0"

#(set-default-paper-size "a5")

lowerChords = { \override ChordName.Y-offset = #-3 }

% No 'Music engraving by LilyPond ...'
\header {
    tagline = ##f
    title = \markup \center-column { "Auld Lang Syne" \teeny " " }
    composer = \markup { \tiny "tune Scottish trad." }
    poet = \markup \left-column { \tiny "Words by Robert Burns (1788)"
                                  \tiny "Capo 2nd fret (sounding key D major)" }
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

melody = \relative c' {
  \key f \major
  \time 3/4
  \partial 1

  c4  f2 f4  f2 a4  g2 f4  g2 a8( g)  f2 f4  a2 c4
  d2.~  d2 d4 c2 a4  a2 f4  g2 f4  g2 a8( g)  f2 d4
  d2 c4  f2.~  f2 d'4 \bar "||" c2( a4)  a2( f4)  g2 f4  g2 d'4 c2( a4)
  a2( c4)  d2.~  d2 f4  c2 a4  a2 f4  g2 f4  g2 a8( g)
  f2( d4)  d2(^\markup {\italic\tiny "     rit."} c4)  f2.~ f2  \bar "||"
}
versei = \lyricmode {
  Should auld ac -- quaint -- ance be for -- got
  and __ ne -- ver bro't to mind? __
  Should auld ac -- quaint -- ance be for -- got
  and __ days of auld lang syne? __
  For auld __ lang __ syne, my dear,
  for auld __ lang __ syne, __
  we'll take a cup o' kind -- ness yet
  for auld __ lang __ syne. __
}

changes = \chordmode {
  r4 f4*3 d4*3:m g4*3:m c4*3:7 f4*3 f4*3:7
  bes4*6 f4*3 d4*3:m g4*3:m c4*3:7 d4*3:m
  bes2 c4:7 f4*6 f4*3 d4*3:m g4*3:m c4*3:7 f4*3
  f4*3:7 bes4*6 f4*3 d4*3:m g4*3:m c4*3:7
  d4*3:m bes4*2 c4:7 f4*2 bes4 f4
}

\score {
  <<
    \context ChordNames {
      \override ChordNames.ChordName.font-name = #"Century Schoolbook L"
      \override ChordNames.ChordName.font-size = #-1
      \override ChordNames.ChordName.Y-extent = #'(1 . 3)
      \override ChordNames.ChordName.Y-offset = #-1
      %\set chordChanges = ##t
      \transpose f c \changes
    }
    \context Staff = soprano <<
      \context Voice = soprano { << \transpose f d \melody >> }
      \addlyrics { \versei }
    >>
  >>
 \layout {
  % \context {
  %   \Lyrics
  %   minimumVerticalExtent = #'(0 . 0)
  % }
 }
 % \midi { }
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

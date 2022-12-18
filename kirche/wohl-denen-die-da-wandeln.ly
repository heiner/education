% 295
% Wohl denen, die da wandeln
% Text: cornelius Becker 1602
% Melodie und Satz: Heinrich Schütz 1661

\version "2.24.0"

#(set-default-paper-size "a5")

% No 'Music engraving by LilyPond ...'
\header { tagline = ##f }

\layout {
  % Don't outdent after first line
  indent = 0\in

  % Don't count the bar numbers when breaking scores
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

global = {
  \override Staff.BarLine.transparent = ##t
  % the final bar line is not interrupted
  \revert Staff.BarLine.transparent
  \bar "|."
}

\score {
  \new StaffGroup <<
    \new Staff <<
      \override Staff.BarLine.transparent = ##t
      \clef treble
      \new Voice = "Sop" {
        \voiceOne { \key g \major \time 4/4 \partial 4 }
        \relative c' {
          d
        }
      }
      \new Voice = "Alto" { \voiceTwo
        \relative c' {
          b
        }
      }
      \new Lyrics \lyricsto "Sop" { Wohl }
    >>
    \new Staff <<
      \override Staff.BarLine.transparent = ##t
      \clef bass
      \key g \major
      \time 4/4
      \new Voice = "Tenor" { \voiceOne \key g \major \time 4/4 \partial 4
        \relative c' {
          g
        }
      }
      \new Voice = "Bass" { \voiceTwo
        \relative c' {
          g
        }
      }
    >>
  >>
}

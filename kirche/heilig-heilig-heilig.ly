% 185.2
% Heilig, Heilig, Heilig (Sanctus)
% Melodie: gregorianisch 13. Jh

\version "2.24.0"
\include "gregorian.ly"

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

chant = \relative c'' {
  \key f \major
  \set Score.timing = ##f
  a4 {a g}  \divisioMinima a {a g} \divisioMinima
  f g a a a a a a g  {a a}  \divisioMinima
  f g a a g bes a a g  {f f}  \divisioMinima
  f g a a a f a  {a a}  \divisioMinima
  f g a a a a a g bes a a g  {f f} \divisioMinima
  d f  f g  g a g  g f  {f g g} \bar "|."
}

verba = \lyricmode {
    Hei --  \skip4 lig, hei -- \skip4 lig, hei -- lig ist Gott,
    der Her -- re Ze -- ba -- \skip4 oth, al -- le
    Lan -- de sind sei -- ner Eh -- re
    \once \override LyricText.self-alignment-X = #-1
    "voll"
    Ho -- si -- an -- na in der Hö -- _ he.
    Ge -- lo -- bet sei der da komt im Na -- men
    des Her -- r -- en. Ho -- si -- a -- n -- na in der
    Hö -- _ _ he.
}

\score {
  \new Staff <<
    \new Voice = "melody" \chant
    \new Lyrics = "one" \lyricsto melody \verba
  >>
  \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
      \remove "Bar_engraver"
      \override Stem.transparent = ##t
    }
    \context {
      \Voice
      %\override Stem.length = #0
    }
    \context {
      \Score
      forbidBreakBetweenBarLines = ##f
    }
  }
}


\header {
    title = \markup \center-column { \medium\larger
                                     "Humpty Dumpty" \teeny " " }
    tagline = ""
}

\version "2.24.0"

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 148\mm
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


melody_wheeler = \relative c' {
  \key bes \major
  \time 6/8

  d4 f8 es4 g8 | f8 g a bes4 r8 |
  d,4 f8 es4 g8 |
  f es d c4 r8 |
  d d f es es g
  f g a bes4 bes16 bes |
  d8 d bes
  es es d |
  c bes a bes4.
}

melody = \relative c' {
  \key bes \major
  \time 6/8

  \easyHeadsOn

  d4 f8 es4 g8 | f8 g a bes4 r8 |
  d,4 f8 es4 g8 |
  f es d c4 r8 |
  d d f es es g
  f g a bes4 r8 |
  d8 d bes
  es es d |
  c bes a bes4.
}

verse = \lyricmode {
  Hump -- ty Dump -- ty sat on a wall.
  Hump -- ty Dump -- ty had a great fall.
  All the king's hors -- es and all the king's men
  Could -- n't put Hump -- ty to -- geth -- er a -- gain.
}

\score {
  <<
    \new Voice = "lead" {
      \melody
    }
    \new Lyrics \lyricsto "lead" \verse
  >>
}

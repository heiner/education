%
% Based on https://commons.wikimedia.org/wiki/File:Vent_frais_vent_du_matin.svg
%

\version "2.18.2"  % necessary for upgrading to future LilyPond versions.

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 148\mm
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

\header {
   title =  \markup \center-column { \medium\larger "Hejo! Spann den Wagen an!"}
   composer = "Music: Thomas Ravenscroft (1609)"
   arranger = " "
   tagline = ##f  % No 'Music engraving by LilyPond ...'
}

themea = {
  \relative c'{
    d2 c
    d8 d d d a2
  }
}

themea_heighho = {
  \relative c'{
    d2 c
    d4 d8 d a2
  }
}

themeb = {
  \relative c'{
    d4 d e e
    f8 f f f e2
  }
}

themec = {
  \relative c'' {
    a4. g8 a4. g8
    a4. g8 a8 g f e
  }
}

themec_hejo = {
  \relative c'' {
    a8 a a a a4 a
    a8 a a a a8( g f e)
  }
}

theme_heigh_ho = {
  \themea_heighho
  \themeb
  \themec
}

theme_hejo = {
  \themea
  \themeb
  \themec_hejo
}

lyrics_hejo = \lyricmode {
  He -- jo! Spann den Wa -- gen an!
  Denn der Wind treibt Re -- gen ü -- bers Land!
  Holt die gold -- nen Gar -- ben,
  holt die gold -- nen Garben! __
}

lyrics_heighho = \lyricmode {
 Heigh ho, no -- bo -- dy home.
 Meat nor drink nor mo -- ney have I none.
 Still I will be mer -- ry, mer -- ry, mer -- ry.
}


changes = \transpose f f { \chordmode {
  g2:m d:m g:m d:m
  g:m d:m g:m d:m
  g:m d:m g:m d:m
  }
}


\score {

\new GrandStaff <<

  \context ChordNames {
    \override ChordNames.ChordName.font-name = #"Century Schoolbook L"
    \set chordChanges = ##t
    \changes
  }

\new Staff \transpose c f { \relative c' {
      \numericTimeSignature
      \time 2/2 {
      \key a \minor
         % \tempo 4 = 100
         \new Voice = "hejo" {
             \theme_hejo
         }
       }
    }
}

\new Lyrics \lyricsto "hejo" \lyrics_hejo

\new Staff \transpose c f {
      \numericTimeSignature
      \time 2/2 {
      \key a \minor
         \new Voice = "heighho" {
         \theme_heigh_ho
       }
    }
}

\new Lyrics \lyricsto "heighho" \lyrics_heighho

>>

\layout {}
\midi {}

}

\markup {
  \column {
  \line { \italic "French" }
  \line { Vent frais, vent du matin }
  \line {Vent qui souffle au sommet des grands pins}
  \line { Joie du vent qui souffle, allons dans le grand }
}}
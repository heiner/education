\header {
    title = \markup \center-column { \medium\larger
                                     "Symphonie No. 3" \teeny " " }
    subtitle = \markup { \medium "Posaunen-Solo" }
    composer = "Gustav Mahler"
    tagline = ""
}

% https://www.youtube.com/watch?v=Af1AzoGFCLM
%

\version "2.24.0"

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 148\mm
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

semff =
#(make-dynamic-script
  (markup #:hspace 0
          #:translate '(-18.85 . 0)
          #:line (#:normal-text
                  #:italic "sempre"
                  #:dynamic "ff")))

TbnOne = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \time 3/2
  \tempo 2 = 45
  \key f \major
  \mark #13
  R1. R1.
  a1^>_\ff r2
  a1^> r2
  \numericTimeSignature

  {\time 2/2}
  \tuplet 3/2 {r4^"Triolen nicht schleppend" e4_\semff f4^>}
  \tuplet 3/2 {g4^> f4^> e4^>}
  bes2^>( a2)~ a2 r2

  \time 3/2
  \mark \default
  a1^>_\semff r8 d'8_"vorwärts" c'8 bes8

  \time 2/2
  a4^>_"nicht zurückhalten" gis^> \tuplet 3/2 {cis'4 b4 g4}

  \tuplet 3/2 {fis4^> a a,} f2^>~ f2~ f8 e8 cis8 d8
  e2^>~ \tuplet 3/2 {e4 a,_> e^> }
  a2^>~ \tuplet 3/2 {a4 a, f}
  a8^> f a, f a2~ a1~ a1~ a1~ a4 r4 r2
  \compressMMRests { R1*2/2*2 }
  r2 r4 a,
  \time 3/2
  \mark \default
  e1.^>
  \time 2/2 r2 a,2^>
  \time 3/2 e1^> r8 g8^> f^> e^>
  \time 2/2 bes2^> a^>
  r2 r4 a,
  \time 3/2 e1.^>
  \time 2/2
  \tuplet 3/2 {r4 g^> f^>}
  \tuplet 3/2 {e4^> g^> bes^>}
  d'2^>( cis'^>)~ \time 3/2 cis'2 r1
  \time 2/2
  \tempo 2 = 60
  \mark \default
  d'2^> a^>~ a4 gis^> \tuplet 3/2 { cis'^> b^> g^> }
  \tuplet 3/2 { fis^> a a, } f2^>~
  \tuplet 3/2 { f4 e f^> } \tuplet 3/2 { a^> g^> es^> }
  d2^"Wild" r8 cis8 d e
  f2 r8 cis8 d e
  e2~ \tuplet 3/2 { e4 a,_> e^> }
  a2~ \tuplet 3/2 { a4 a,_> f^> }
  a8 f a, f a2~
  a2~ \tuplet 3/2 { a4 fis^> a,_> }
  \tuplet 3/2 { d4 fis a, }
  \tuplet 3/2 { d fis a }
  \tuplet 3/2 { d'2^> b4 }
  \tuplet 3/2 { d'2^> b4 }
  \tuplet 3/2 { d'4 a fis }
  \tuplet 3/2 { g4 f es }
  \tuplet 3/2 { fis^> d^> g^> }
  f2^>~ f2 e2^>
  \mark \default
  d8 r8 r4 r2
  \compressMMRests { R1 * 2 }
  r2 r4 r16 d16 f a
  cis'1~ cis'1
  r1
  r1
}

\score {
  <<
    \new Staff { \clef bass \TbnOne }
  >>
  \layout { }
  \midi {}
}

\score {
  <<
   \new TabStaff { \TbnOne }
  >>
}

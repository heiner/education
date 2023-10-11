
\header {
    tagline = ""
    title = \markup \center-column { \medium\larger
                                     "Silent Night, Holy Night" \teeny " " }
    composer = "Melody: Franz Xaver Gruber, 1818"
    poet = "Text: Joseph Mohr, 1816"
    piece = "Translation: John Freeman Young, 1859"
    %meter = "Guitar: Capo 2nd fret (sounding key D major)"
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

Melody = {
  \time 6/8 {
    \key bes \major f'8.( g'16) f'8 d'4. f'8.( g'16)
    f'8 d'4. c''4 c''8 a'4. bes'4 bes'8 f'4. g'4 g'8 bes'8.( a'16) g'8
    f'8.( g'16) f'8 d'4. g'4 g'8 bes'8.( a'16) g'8 f'8.( g'16) f'8 d'4. c''4
    c''8 ees''8.( c''16) a'8 bes'4.( d'') bes'8.( f'16) d'8 f'8.( ees'16) c'8
    bes2.  \bar "||"
  }
}

Soprano = {
  \time 6/8 {
    \key bes \major f'8. g'16 f'8 d'4. f'8. g'16
    f'8 d'4. c''4 c''8 a'4. bes'4 bes'8 f'4. g'4 g'8 bes'8. a'16 g'8
    f'8. g'16 f'8 d'4. g'4 g'8 bes'8. a'16 g'8 f'8. g'16 f'8 d'4. c''4
    c''8 ees''8. c''16 a'8 bes'4. d'' bes'8. f'16 d'8 f'8. ees'16 c'8
    bes2.  \bar "||"
  }
}

Alto = { { \key bes \major d'8. ees'16 d'8 bes4. d'8. ees'16 d'8
bes4. ees'4 ees'8 c'4. d'4 d'8 d'4. ees'4 ees'8 g'8. f'16 ees'8
d'8. ees'16 d'8 bes4. ees'4 ees'8 g'8. f'16 ees'8 d'8. ees'16 d'8
bes4. ees'4 ees'8 a'8. ees'16 c'8 d'4. f' d'8. f'16 bes8 d'8. c'16 a8
bes2.  \bar "||" } }
Tenor = { { \key bes \major bes4 bes8 f4. bes4 bes8 f4. a4 a8 f4. f4
f8 bes4. bes4 bes8 g8. a16 bes8 bes8. bes16 bes8 f4. bes4 bes8 g8. a16
bes8 bes8. bes16 bes8 f4. a4 a8 c'8. a16 f8 f4. bes bes4 f8 f8. f16
ees8 d2.  \bar "||" } }
Bass = { { \key bes \major bes,4 bes,8 bes,4. bes,4 bes,8 bes,4. f4 f8
f4. bes,4 bes,8 bes,4. ees4 ees8 ees8. ees16 ees8 bes,8. bes,16 bes,8
bes,4. ees4 ees8 ees8. ees16 ees8 bes,8. bes,16 bes,8 bes,4. f4 f8
f8. f16 f8 bes,2 ( bes,4 ) f f8 f,8. f,16 f,8 bes,2.  \bar "||" } }

%verse = \lyricmode {
%  Stil -- le Nacht, heili -- ge Nacht.
%  Al -- les schläft, ein -- sam wacht
%  nur das traute hoch -- heili -- ge Paar.
%  Hol -- der Knabe im locki -- gen Haar,
%  schlaf in himmli -- scher Ruh
%  schlaf in himmli -- scher Ruh.
%}

verse = \lyricmode {
Si -- lent night! Ho -- ly night!
All is calm, all is bright
Round yon vir -- gin mother and child!
Ho -- ly infant, so tender and mild,
Sleep in heaven -- ly peace!
Sleep in heaven -- ly peace!
}

\score {
  <<
    \new Voice = "lead" {
      \Melody
    }
    \new Lyrics \lyricsto "lead" \verse

    \context GrandStaff <<
      \context Staff = upper <<
        \set Staff.printPartCombineTexts = ##f
        \new Voice = "singer" { \partCombine \Soprano \Alto }
      >>
      \context Staff = lower <<
        \set Staff.printPartCombineTexts = ##f
        \clef bass
        \partCombine { \Tenor } { \Bass }
      >>
    >>
  >>
  \layout { }
  \midi {}
}


\markup {
  \fill-line {
    % moves the column off the left margin;
    % can be removed if space on the page is tight
    \hspace #0.1
    \column {
    \line { \bold "2."
    \column {
      \line { Silent night! Holy night! }
      \line { Shepherds quake at the sight! }
      \line { Glories stream from heaven afar, }
      \line { Heavenly hosts sing Alleluia! }
      \line { Christ the Saviour is born! }
      \line { Christ the Saviour is born! }
    }
  }

  }
  % adds horizontal spacing between columns
  \hspace #0.1
  \column {
    \line { \bold "3."
      \column {
        \wordwrap-string "
          Silent night! Holy night!

          Son of God, love's pure light

           Radiant beams from thy holy face

           With the dawn of redeeming grace,

           Jesus, Lord, at thy birth!

           Jesus, Lord, at thy birth!"
      }
   }
 }
 \hspace #0.1
 }
}
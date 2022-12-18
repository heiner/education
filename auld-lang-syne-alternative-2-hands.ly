% Auld Lang Syne
% abgeschrieben von http://de.wikibooks.org/wiki/Liederbuch:_Auld_Lang_Syne

\version "2.24.0"

#(set-default-paper-size "a4")

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 148\mm
}

lowerChords = { \override ChordName.Y-offset = #-3 }

\header {
    tagline = \markup \small { "Music engraving by" \italic "LilyPond" }
    title = \markup \center-column { \medium\larger "Auld Lang Syne" \teeny " " }
    composer = "tune Scottish trad."
    poet = "Words by Robert Burns (1788)"
    meter = "Guitar: Capo 2nd fret (sounding key D major)"
}

\layout {
  % Don't outdent after first line
  %indent = 0\in

  % Don't count the bar numbers when breaking scores
  %\context {
  %  \Score
  %  \remove "Bar_number_engraver"
  %}
}

upper = \relative c' {
  \key f \major
  \time 4/4
  \partial 4

  <c bes>4
  <c f>4. <c f>8 <c f>4 <c a'>4
  <e g>4. <f d>8  <e g>4 <e a>4 % hier war mal a( g)
  <c f>4. <c f>8 <f a>4 <f c'>
  <bes d>2. <f d'>4
  <f c'>4. <f a>8 <f a>4 <c f>4
  <e g>4. <d f>8 <e g>4 <f a>8( <e g>)
  <d f>4. <bes d>8 <bes d>4 <bes c>
  <c f>2. <f d'>4
  <f c'>4.( <f a>8) <f a>4( <c f>)
  <e g>4. <c f>8 <e g>4 <g d'>
  <a c>4.( <f a>8) <f a>4( <a c>)
  <bes d>2. <bes f'>4 % war <bes d>
  <a c>4. <f a>8 <f a>4 <c f>
  <e g>4. <d f>8 <e g>4 <f a>8( <e g>)
  <d f>4.( <d bes>8) <d bes>4((^\markup {\italic\tiny "    rit."} <bes c>)
  <a f'>2.~<a f'>4 \bar "||"
  %f2( d4)  d2(^\markup {\italic\tiny "     rit."} c4)  f2.~ f2  \bar "||"
}

lower = \relative c {
  \clef bass
  \key f \major
  \time 4/4
  \partial 4

  <c g'>4
  <f a>2 <f a>2  <c g'>2 <c g'>2
  <f a>2 <f c'>4 <f a>  <f bes>2. <f bes>4
  <a c>2 <f a>  <e c'>2 <e c'>2
  <d a'>4. <f d>8 <f d>4 <e g>
  <f a>2. <f bes>4
  <f a>2 <f c'>4 <f a>
  <c g'>2 <c g'>4 <c bes'>
  <f a>2 <es a>
  <d bes'>2. <d bes'>4
  <f a>2 <c a'>
  <c g'> <c g'>4 <cis a'>
  <d a'>2 <bes f'>4 <c e>
  <f, f'>2.~<f' f,>4
}

verse = \lyricmode {
  Should auld ac -- quaint -- ance be for -- got
  and ne -- ver bro't to mind?
  Should auld ac -- quaint -- ance be for -- got
  and days of auld lang syne?
  For auld lang syne, my dear,
  for auld lang syne,
  we'll take a cup o' kind -- ness yet
  for auld lang syne. __
}

changes = \chordmode {
  r4 f4*2 d4*2:m g4*2:m c4*2:7 f4*2 f4*2:7
  bes4*4 f4*2 d4*2:m g4*2:m c4*2:7 d4*2:m
  bes4 c4:7 f4*4 f4*2 d4*2:m g4*2:m c4*2:7 f4*2
  f4*2:7 bes4*4 f4*2 d4*2:m g4*2:m c4*2:7
  d4*2:m bes4 c4:7 f4*2 bes4 f4
}

\score {
  <<
    \new ChordNames {
     \override ChordNames.ChordName.font-name = #"Century Schoolbook L"
     \override ChordNames.ChordName.font-size = #-1
     \override ChordNames.ChordName.Y-extent = #'(1 . 3)
     \override ChordNames.ChordName.Y-offset = #-1

     \transpose f c \changes
    }
    \new GrandStaff <<
      \new Staff = upper {
        \new Voice = "singer"
        \transpose f f \upper
      }
      \new Lyrics \lyricsto "singer" \verse
      \new Staff = lower {
        \clef bass
        \transpose f f \lower
      }
    >>
  >>
  \layout {
    \context { \GrandStaff \accepts "Lyrics" }
    %\context { \Lyrics \consists "Bar_engraver" }
  }
  \midi {
    \context {
      % Tempo of the midi file: 100 quarter notes (4) per minute
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100/4)
    }
    \context {
      % Don't have the chords in the midi file
      \ChordNames
      \remove Note_performer
    }
  }
}

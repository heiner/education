% Amazing Grace
% von http://www.mail-archive.com/lilypond-user@gnu.org/msg36792.html

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
    tagline = ##f
    title = \markup \center-column { \medium\larger "Amazing Grace"}
    composer = "Early American Melody"
    poet = "words by John Newton"
}


global = {
  \time 3/4
  \partial 4 s4
  s4*3*15 s4*2
  \bar "|."
}
Key = { \key c \major }
i   = \relative c' { \tuplet 3/2 { e8( d c) } | e2 }
melody = \relative c' {
  \Key
  g8( c) c2 \i e8( d) c2 a4 | g2
  g8( a) c2 \i d8( e) g2.~g2
  e8( g) g2 \i e8( d) c2 a4 g2
  g8( a) c2 \i d4 c2.~c2
}
i   = \lyricmode { }
versei = \lyricmode {
  \set stanza = "1 "
  A -- ma -- zing grace,
  how sweet the sound that saved a wretch like me!
  I once was lost but now am found, was blind but now I see.
}

changes = \chordmode {
  \transpose g c {
    r4 g4*3*2 c4*3 g4*3*3 d2 a4:m d4*3 g g:7 c g e:m a2:m7 d4:7 g2 c4 g2
  }
}

\score {
  <<
    \context Staff = soprano <<
      \context Voice = soprano { << \global \transpose c g \melody >> }
      \addlyrics { \versei }
    >>
  >>
 \layout { }
 \midi { }
}

\markup {
  \fill-line {
    % moves the column off the left margin;
    % can be removed if space on the page is tight
    \hspace #0.1
    \column {
    \line { \bold "2"
    \column {
      \line { ’Twas grace that taught my heart to fear, }
      \line { and grace my fears relieved; }
          \line { how precious did that grace appear, }
          \line { the hour I first believed! }
    }
  }

  }
  % adds horizontal spacing between columns
  \hspace #0.1
  \column {
    \line { \bold "3"
      \column {
        \wordwrap-string "
          Through many dangers, toils and snares,

          I have already come;

          ’tis grace hath brought me safe thus far,

          and grace will lead me home."
      }
   }
 }
 \hspace #0.1
 }
}
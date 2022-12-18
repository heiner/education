% 185.2
% Heilig, Heilig, Heilig (Sanctus)
% Melodie: gregorianisch 13. Jh

% Lilypond-Stil: Versuche
% http://lilypond.org/cygwin/release/lilypond/lilypond-doc/x/usr/share/doc/lilypond/html/Documentation/user/lilypond/Working-with-ancient-music_002d_002dscenarios-and-solutions.ja.html#Transcribing-Gregorian-chant
%

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
  %title = "Heilig, Heilig, Heilig"
}

\layout {
  % Don't outdent after first line
  indent = 0\in

  % Don't count the bar numbers when breaking scores
  \context {
    \Score
    \remove "Bar_number_engraver"
    \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/2)
  }
}

divisioMinima = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-minima

  % Workaround: add padding.  Correct fix would be spacing engine handle this.
  \once \override BreathingSign.X-extent = #'(10 . 0)

  \breathe
}

chant = \relative c'' {
  \key f \major
  \time 1/4
  %\override Lyrics.LyricText.X-extent  = #'(0 . 3)
  a4 {a8 g} \divisioMinima a4 {a8 g} \divisioMinima
  f4 g a a a a a a g
  \once \override Lyrics.LyricText.X-extent  = #'(0 . 2)
  {a8 a} \divisioMinima
  f4 g a a g bes a a g
  \once \override Lyrics.LyricText.X-extent  = #'(0 . 2.5)
  {f8 f}  \divisioMinima
  f4 g a a a f a {a8 a}  \divisioMinima
  f4 g a a a a a g bes a a g
  \once \override Lyrics.LyricText.X-extent  = #'(0 . 2)
  {f8 f} \divisioMinima
  d4 f {f8 g} g4 a g {g8 f}
  \tuplet 3/2 {
  \once \override Lyrics.LyricText.X-extent  = #'(0 . 1)
  f8 g g} \bar "|."
}

verba = \lyricmode {
    Hei -- lig, _ hei -- lig, _ hei -- lig ist Gott,
    der Her -- re Ze -- "ba" -- oth, \skip1 al -- le
    Lan -- de sind sei -- ner Eh -- re voll. \skip1
    Ho -- si -- an -- na in der Hö -- he. _
    Ge -- lo -- bet sei, der da kommt im Na -- men
    des Her -- ren. \skip1 Ho -- si -- an -- _ na in der
    "   Hö " -- \skip1 " he." \skip1
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
      \override BarLine.X-extent = #'(-1 . 1)
      \override Stem.transparent = ##t
      \override Beam.transparent = ##t
      \override BarLine.transparent = ##t
      \override TupletNumber.transparent = ##t
    }
  }
  \midi { }
}

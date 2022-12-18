% 190.2
% Christe, du Lamm Gottes
% Melodie: Martin Luther (1525) (1528)

% Lilypond-Stil: Versuche
% http://lilypond.org/cygwin/release/lilypond/lilypond-doc/x/usr/share/doc/lilypond/html/Documentation/user/lilypond/Working-with-ancient-music_002d_002dscenarios-and-solutions.ja.html#Transcribing-Gregorian-chant
%

\version "2.12.3"

%#(set-default-paper-size "a5")

% No 'Music engraving by LilyPond ...'

\header {
    tagline = ##f
    %title = "Christe, du Lamm Gottes"
}

\paper  {
  myStaffSize = #18
  #(define fonts
    (make-pango-font-tree "Minion Pro"
     "Myriad Pro"
     "Luxi Mono"
     (/ myStaffSize 20)))
}

\layout {
  % Don't outdent after first line
  indent = 0\in

  % Don't count the bar numbers when breaking scores
  \context {
    \Score
    \remove "Bar_number_engraver"
    \override SpacingSpanner
        #'common-shortest-duration = #(ly:make-moment 1 1)
  }
}

divisioMinima = {
  \once \override BreathingSign  #'stencil = #ly:breathing-sign::divisio-minima

  % Workaround: add padding.  Correct fix would be spacing engine handle this.
  \once \override BreathingSign  #'X-extent = #'(0.6 . 0.0)

  \breathe
}

chant = \relative c' {
  \key f \major
  \time 1/4
  %\override Lyrics.LyricText #'X-extent  = #'(1 . 0)
  f4 g a a {bes8 bes} a4 \divisioMinima
  a g a bes {c8 c} bes4 a \divisioMinima
  a g f {a8 a} g4 \divisioMinima
  f g a a {bes8 bes} a4 \divisioMinima
  a g a bes {c8 c} bes4 a \divisioMinima
  a g f {a8 a} g4 \divisioMinima
  f g a a {bes8 bes} a4 \divisioMinima
  a g a bes {c8 c} bes4 a \divisioMinima
  a a g f
  {a8 a}
  \once \override Lyrics.LyricText #'X-extent  = #'(0 . 3)
  {g8 g8} \divisioMinima
  %\override Lyrics.LyricText #'X-extent  = #'(10 . 0)
  \times 8/8 {f32 g a bes bes a g f}
  {g8 g}
  \bar "|."
}

verba = \lyricmode {
    Chri -- ste, du Lamm "  Got" -- \skip1 tes, der du trägst die "   Sünd" \skip1
    der Welt, er -- barm dich un -- _ ser.
    Chri -- ste, du Lamm "  Got" -- \skip1 tes, der du trägst die "   Sünd" \skip1
    der Welt, er -- barm dich un -- _ ser.
    Chri -- ste, du Lamm "  Got" -- \skip1 tes, der du trägst die "   Sünd" \skip1
    der Welt, gib uns dei -- nen "  Frie" -- \skip1 "den." \skip1
    "A   " -- _ _ _ _ _ _ _ "   men." \skip1
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
      \override BarLine #'X-extent = #'(-1 . 1)
      \override Stem #'transparent = ##t
      \override Beam #'transparent = ##t
      \override BarLine #'transparent = ##t
      \override TupletNumber #'transparent = ##t
    }
  }
  \midi { }
}

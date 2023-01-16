\version "2.24.0"

#(set-default-paper-size "a4")

#(define (conditional-kern-before markup bool amount)
  "Add AMOUNT of space before MARKUP if BOOL is true."
  (if bool
      (make-line-markup
       (list (make-hspace-markup amount)
             markup))
      markup))
#(define (accidental->markup alteration)
  "Return accidental markup for ALTERATION."
  (if (= alteration 0)
      (make-line-markup (list empty-markup))
      (conditional-kern-before
       (alteration->text-accidental-markup alteration)
       (or (= alteration FLAT) (= alteration SHARP)) 0.2)))

#(define (note-name->markup-lowercase pitch rest)
   "Return pitch markup for PITCH in lowercase."
   (make-line-markup
    (list
     (make-simple-markup
      (vector-ref #("c" "d" "e" "f" "g" "a" "b") (ly:pitch-notename pitch)))
      (accidental->markup (ly:pitch-alteration pitch)))))

\header {
    tagline = \markup \small { "Music engraving by" \italic "LilyPond" }
    title = \markup \center-column { \medium\larger "The First Noel" \teeny " " }
    composer = "trad. English carol"
    poet = "arr. first published 1833"
    %meter = "Guitar: Capo 2nd fret (sounding key D major)"
}


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

melody = {
  \time 3/4
  { \key d \major \partial 4
    fis'8( e') d'4.( e'8) fis'[( g')] a'2
    b'8( cis'') d''4 cis'' b' a'2 b'8 cis'' d''4 cis'' b' a' b' cis'' d'' a'
    g' fis'2 fis'8( e') d'4.( e'8) fis'[ g'] a'2 b'8( cis'') d''4 cis'' b' a'2
    b'8 cis'' d''4 cis'' b' a'( b') cis'' d''( a') g' fis'2 fis'8( e')
    d'4.( e'8) fis'[( g')] a'2 d''8( cis'')
    b'2 b'4 a'2~a'4 d'' cis'' b' a'( b') cis'' d''( a') g'
    fis'2 \bar "||"
  }
}
versei = \lyricmode {
  The first No -- el the an -- gels did sing
  was to cer -- tain poor shep -- herds in fields as they lay;
  in fields where _ they lay a-keep -- ing their sheep
  on a cold win -- ter's night that was so deep.

  No -- el, No -- el, No -- el, No -- el
  born is the king of Is -- ra -- el.
}

changes = \chordmode {
  \set chordNoteNamer = #note-name->markup-lowercase

  r4 g4*2 e4:m d4*2 c4 g4*2 c4 g4*2
  c4 g4*2 c4 g4 c4 d4  g4 d4*2 g4*3
     g4*2 e4:m d4*2 c4 g4*2 c4 g4*2
  c4 g4*2 c4 g4 c4 d4  g4 d4*2 g4*3
     g4*2 e4:m d4*2 g4/b c4*2 d4 g4*3
  e4:m d4 c4 g4 c4 d4  g4*2 d4 g4
}


\score {
  <<
    \context ChordNames {
      \override ChordNames.ChordName.font-name = #"Century Schoolbook L"
      \override ChordNames.ChordName.font-size = #-1
      \override ChordNames.ChordName.Y-extent = #'(1 . 3)
      \override ChordNames.ChordName.Y-offset = #-1

      \transpose g d \changes
    }
    \new Voice = "soprano" { \melody }
    \new Lyrics \lyricsto "soprano" { \versei }
  >>
  \layout {}
  \midi {}
}

\markup {
  \fill-line {  \hspace #0.1
  \column {
    \line {
      \column {
        " "
        "They looked up and saw a star"
        "Shining in the east beyond them far"
        "And to the Earth it gave great light"
        "And so it continued both day and night"
      }
      \hspace #2.5
      \column {
        " "
        "And by the light of that same star"
        "three wise men came from country far"
        "to seek for a king was their intent"
        "and to follow the star wherever it went."
      }
    }
  }
  \hspace #0.1 }
}

%\markup{
%  \bold "2" \hspace #0.4 % Eigentlich Vers 4
%  \wordwrap-string "
%  Dein Wort, Herr, nicht vergehet, /
%  es bleibet ewiglich, /
%  so weit der Himmel gehet, /
%  der stets beweget sich; /
%  dein Wahrheit bleibt zu aller Zeit /
%  gleichwie der Grund der Erden, /
%  durch deine Hand bereit’."
%}

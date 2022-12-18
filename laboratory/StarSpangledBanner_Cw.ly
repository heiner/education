\version "2.10.10"

#(set-default-paper-size "a4")

\header {
  tagline = \markup \small { "Music engraving by" \italic "LilyPond" }
  title = \markup \center-column { \medium\larger "The Star-Spangled Banner" \teeny " " }
  composer = "Music: John Stafford Smith"
  poet = "Words: Francis Scott Key"
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

wordsdefaultVA = \lyricmode {
Oh, say, can you see by the dawn's ear -- ly light,
What so proud -- ly we hailed at the twi -- light's last gleam -- ing?
Whose broad stripes and bright stars thro' the pe -- ri -- lous fight,
O'er the ram -- parts we watched were so gal -- lant -- ly stream -- ing;
And the roc -- kets' red glare, the bombs burst -- ing in air,
Gave proof thro' the night that our flag was still there.
Oh, say, does that star -- span -- gled ban -- ner yet  wave
O'er the  land of the free, and the home of the brave?
}

melody =  {
  \time 3/4 \key c \major
  \partial 1
  g'8 ( e'8 -) c'4 e'4 g'4 c''2 e''8 d''8 c''4 e'4 fis'4 g'2 g'8 g'8
  e''4.  d''8 c''4 b'2 a'8 b'8 c''4 c''4 g'4 e'4 c'4 g'8 e'8 c'4
  e'4 g'4 c''2 e''8 d''8 c''4 e'4 fis'4 g'2 g'8 g'8 e''4.  d''8
  c''4 b'2 a'8 b'8 c''4 c''4 g'4 e'4 c'4 e''8 e''8 e''4 f''4 g''4
  g''2 f''8 e''8 d''4 e''4 f''4 f''2 f''4 e''4.  d''8 c''4 b'2
  a'8 b'8 c''4 e'4 fis'4 g'2 g'4 c''4 c''4 c''8 ( b'8 -) a'4 a'4
  a'4 d''4 f''8 ( e''8 -) d''8 ( c''8 -) c''4 ( b'4 ^\fermata -)
  g'8 g'8 c''4. ( d''8 -) e''8 f''8 g''2 ^\fermata c''8 d''8
  e''4.  f''8 d''4 c''2.
}

\score{
  <<
    \context Staff="default"
    {
      \melody
    }
    \addlyrics {
      \wordsdefaultVA }
  >>
  \layout {}
  \midi {}
}

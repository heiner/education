\version "2.24.0"

  \header {
    tagline = ""
}

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 148\mm
  print-all-headers = ##t
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


melody = \relative c' {
	\clef treble
	\key g \major
	\time 3/4

	\partial 4 d4^\markup { \italic Brightly. }
	e d g
	fis2 d4
	e d a'
	g2 d4
	d' b g
	fis e c'
	b g a
	g2\fermata
	\bar "|."
}

lyrs = \lyricmode { Good morn- ing to you, Good morn- ing to you, Good morn- ing dear chil- dren, Good morn- ing to all. }

accomp = \relative c' {
	\clef treble
	\key g \major
	\time 3/4

	\partial 4 d4
	<b e> d <b g'>
	<c fis>2 d4
	<c e> d <c a'>
	<b g'>2 <b d>4

	<<
	\new Voice {
		\voiceOne
		d'4 b <g d>
	}
	\new Voice {
		\voiceTwo
		<d g>2
	}
	>>

	<d fis>4 <c e> <c c'>

	<<
	\new Voice {
		\voiceOne
		b' g <c, a'>
	}
	\new Voice \relative c' {
		\voiceTwo
		d2
	}
	>>

	<b g'>2\fermata
}

accompbass = \relative c {
	\clef bass
	\key g \major
	\time 3/4

	\partial 4 r4

	<<
	\new Voice {
		\voiceOne
		d2 d4
		d2 d4
	}
	\new Voice {
		\voiceTwo
		g,2.
		a2.
	}
	>>
	<d, d'>2 <d d'>4
	<g d'>2 <g g'>4
	<b g'>2 q4
	<c g'>2 <a e' a>4
	d2 <d fis>4
	\stemDown
	<g, d' g>2\fermata
}

\book {

\score {

  \header {
    title = \markup \center-column { \medium\larger
                                     "Happy Birthday to You" \teeny " " }
    tagline = ""
}


\transpose f g
{ \relative c'
  {
    \set Staff.midiInstrument = #"clarinet"
    \key f \major \time 3/4 \partial 4
    \easyHeadsOn c8. c16 | d4 c f | e2 c8. c16 | d4 c g' | f2 c8. c16 | c'4 a f | e( d\fermata) bes'8. bes16 | a4 f g | f2 \bar "|."
  }
}

\addlyrics {
  Hap -- py birth -- day to you,
  Hap -- py birth -- day to you,
  Hap -- py birth -- day dear [NAME],
  __ Hap -- py birth -- day to you.
}

}

\score {
	\header {
      title = \markup \center-column { \medium\larger "Good-Morning To All." }
	}
    <<
      \new Staff { \autoBeamOff \melody }
      \addlyrics { \lyrs }
      \new GrandStaff <<
        \new Staff { \accomp }
        \new Staff { \accompbass }
      >>
    >>

    \layout {
      \context {
        \Score
        \remove "Bar_number_engraver"
      }
    }
  }
}
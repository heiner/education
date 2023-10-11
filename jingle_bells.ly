\version "2.20.0"
\language english

\header {
	title = \markup \center-column { \medium\larger "Jingle Bells"}
	composer = "James Lord Pierpont"
	tagline = ##f
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

melody = \relative c'{
  \clef treble
  \numericTimeSignature
  \time 4/4
  \key g \major
  \easyHeadsOn
  \repeat volta 4{
    d4 b' a g | d2. 4 | 4 b'4 a g | e2. r4 |
    e c' b a | fs2. r4 | d' d c a | b1 | d,4 b' a g | d2. r4 |
    d b' a g | e2. 4 | e4 c' b a | d d d d | e d c a | g2. r4 |
    b4 4 2 | 4 4 2 | 4 d4 g,4. a8 | b2. r4 |
    c4 4 4. 8 | 4 b4 4 8 8 | 4 a4 4 b4 | a2 d4 r |
    b4 4 2 | 4 4 2 | 4 d4 g,4. a8 | b2. r4 |
    c4 4 4. 8 | 4 b4 4 8 8 |
  }
  \alternative {
    \relative b'{ d4 d c a | g2. r4 | }
    \relative b'{ d4 d e fs | g2. r4 | }
  }
  \bar "|."
}

lyric = \lyricmode {
  <<
    {
      \set associatedVoice = "melody"
      Dash -- ing through the snow, in_a one -- horse o -- pen sleigh.
      Over the fields we go, laugh -- ing all the way.
      Bells on bob -- tail ring, mak -- ing spi -- rits bright.
      What fun it is to ride and sing a sleigh -- ing song to -- night!
    }
    \new Lyrics {
      \set associatedVoice = "melody"

    }
  >>
  Jin -- gle bells, jin -- gle bells, jin -- gle all the way!
  Oh, what fun it is to ride in a one -- horse o -- pen sleigh! Hey!
  Jin -- gle bells, jin -- gle bells, jin -- gle all the way!
  Oh, what fun it is to ride in a one -- horse o -- pen sleigh!
  one -- horse o -- pen sleigh!
}

\score {
  \layout {
    \context {
      \Score proportionalNotationDuration = #(ly:make-moment 1/4)
    }
  }

  <<
    \new Staff {
      \new Voice = "melody"
      \melody
    }
    \new Lyrics \lyricsto "melody" {
      \lyric
    }
  >>
}

\markup {
  \fill-line {
    % moves the column off the left margin;
    % can be removed if space on the page is tight
    \hspace #0.1
    \column {
      \line { \bold "2."
        \column \string-lines
        "A day or two ago \n I thought I'd take a ride. \n
        And soon, Miss Fanny Bright \n was seated by my side. \n
        The horse was lean and lank. \n Misfortune seemed his lot. \n
        He got into a drifted bank \n And then we got upsot."
      }
      \vspace #1
      \line { \bold "4."
        \column \string-lines
        "Now the ground is white, \n go it while you're young.
         Take the girls tonight, \n and sing this sleighing song.
         Just get a bobtailed bay, \n two forty as his speed.
         Hitch him to an open sleigh \n and crack! You'll take the lead."
      }
    }
  % adds horizontal spacing between columns
  \hspace #0.1
  \column {
    \line { \bold "3."
      \column \string-lines
        "A day or two ago, \n the story I must tell.
         I went out on the snow, \n and on my back I fell.
         A gent was riding by, \n in a one-horse open sleigh.
         He laughed as there I sprawing lie, \n but quickly drove away."
      }
    }
 \hspace #0.1
 }
}


\version "2.24.0"

#(set-default-paper-size "a4" 'landscape)

\paper{
  top-margin = 3\cm
  bottom-margin = 2\cm
  line-width = 250\mm
}

\header {
    tagline = \markup \tiny { "Music engraving by" \italic "LilyPond" "2.12.3" }
    title = \markup \center-column { \medium\larger "Easy Notes" }
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

#(set-global-staff-size 40)

\score {
  \new GrandStaff <<
    \new Staff = upper {
      \set Score.timing = ##f
      \new Voice = "singer"
      \relative c' {
        \easyHeadsOn
        s4 s s s s s s s s s s s
        a b
        c4 d e f g a b c d e f g a b c
      }
    }
    \new Staff = lower {
      \clef bass
      \relative c, {
        \easyHeadsOn
        c4 d e f g a b c d e f g a b c
        d e
        s s s s s s s s s s s s
      }
    }
  >>
  \layout {
    \context {
      \Staff
      \remove "Bar_engraver"
      \remove "Time_signature_engraver"
    }
  }
}

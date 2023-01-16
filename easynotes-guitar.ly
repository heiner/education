\version "2.24.0"

% \include "predefined-ukulele-fretboards.ly"

#(set-default-paper-size "a4" 'landscape)

\paper{
  top-margin = 5\cm
  bottom-margin = 5\cm
  %line-width = 148\mm
}

\header {
    tagline = \markup { "" }
    title = \markup \center-column { \medium\larger "Easy Notes Guitar" }
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

\score {
   <<
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
    \new TabStaff {
      \set TabStaff.stringTunings = #guitar-tuning
      \relative c, {
        s s
        e f g
        <a\6 a\5>
        <b\6 b\5>
        <c\6 c\5>
        <d\6 d\5 d\4>
        <e\6 e\5 e\4>
        <f\5 f\4>
        <g\5 g\4 g\3>
        <a\5 a\4 a\3>
        <b\4 b\3 b\2>
        <c\4 c\3 c\2>
        <d\4 d\3 d\2>
        <e\3 e\2 e\1>
        <f\3 f\2 f\1>
        <g\3 g\2 g\1>
        <a\2 a\1>
        <b\2 b\1>
        c d e s s s s s
      }
    }
  >>
  \layout {
    #(layout-set-staff-size 45)
    indent = 2\cm
    \context {
      \Staff
      \remove "Bar_engraver"
      \remove "Time_signature_engraver"
    }
  }
}

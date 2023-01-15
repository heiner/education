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
    title = \markup \center-column { \medium\larger "Easy Notes Ukulele" }
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

\score {
  \new Staff {
     \relative c' {
      \easyHeadsOn g'\4_\markup { \hspace #2 Tuning } c,\3 e\2 a\1
    }
  }
  \layout {
    #(layout-set-staff-size 20)
    indent = 12\cm
  }
}


\score {
  <<
    \new Staff {
      \set Score.timing = ##f
      \override Score.NonMusicalPaperColumn.padding = #4
      \relative c' {
        \easyHeadsOn c4 d e f g a b c d e f g a
      }
    }
    \new TabStaff {
      \set TabStaff.stringTunings = #ukulele-tuning
      \relative c' {
        c4
        d
        <e\3 e\2>
        <f\3 f\2>
        <g\4 g\3 g\2>
        <a\4 a\3 a\2 a\1>
        <b\4 b\3 b\2 b\1>
        <c\4 c\3 c\2 c\1>
        <d\4 d\2 d\1>
        <e\4 e\2 e\1>
        <f\4 f\1>
        <g\4 g\1>
        a
      }
   }
  >>
  \layout {
    #(layout-set-staff-size 50)
    indent = 4\cm
  }
}

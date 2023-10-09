\version "2.24.0"

#(set-default-paper-size "a4" 'landscape)

\paper{
  top-margin = 5\cm
  bottom-margin = 5\cm
  %line-width = 148\mm
}

\header {
    tagline = \markup { "" }
    title = \markup \center-column { \medium\larger "Easy Notes Harp" }
}

\layout {
  % Don't outdent after first line
  indent = 0\in
}

% Cf. https://www.pinterest.com/pin/703756183230808/

blow = {
  % TODO: Would be good to draw an invisible circle instead of none.
  \override StringNumber.stencil = #ly:text-interface::print
}

draw = {  % circled.
  \revert StringNumber.stencil
}

\score {
  <<
    \new Staff {
      \set Score.timing = ##f
      \override Score.NonMusicalPaperColumn.padding = #4
      \relative c' {
        \easyHeadsOn
        \hideNotes
        c8 c c c c c
        \unHideNotes
        \blow c8[\4 \draw d\4]
        \blow e[\5 \draw f\5]
        \blow g[\6 \draw a\6]

        \draw b[\7 \blow c\7]
        \draw d[\8 \blow e\8]
        \draw f[\9 \blow g\9]
        \draw a[\10 \blow c\10]
      }
    }
    \new Staff = lower {
      \clef bass
      \relative c {
        \easyHeadsOn
        \set stringNumberOrientations = #'(down)
        \blow c8[\1 \draw d\1]
        \blow e8[\2 \draw g\2]
        \blow g8[\3 \draw b\3]
        s4 s s s s s s
      }
    }
    %\new Lyrics {
    %\lyricmode
    %  { \set fontSize = #-6
    %    "1" "-1" "2" "-2" "3" "-3" "4" "-4" "5" "-5" "6" "-6" "-7" "7" "-8" "8" "-9" "9" "-10" "10" }
    %}
  >>
  \layout {
    #(layout-set-staff-size 30)
    indent = 2\cm
    \context {
      \Staff
      \remove "Bar_engraver"
      \remove "Time_signature_engraver"
    }

  }
}

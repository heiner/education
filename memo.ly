%
% sudo tlmgr install pdfjam
% pdfjam --frame true --nup 3x4 --suffix '3x4' memo.pdf
%
\version "2.24.0"

\paper {
  #(set-paper-size "a10" 'landscape)
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup \null
  evenFooterMarkup = \markup \null
}

\layout {
  indent = 0.8\cm
  top-margin = 5\cm
  bottom-margin = 0\cm
  left-margin = 4\cm

  % Don't count the bar numbers when breaking scores
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \set Score.timing = ##f
  \override Staff.TimeSignature.stencil = ##f
}

#(set-global-staff-size 25)

memo =
#(define-scheme-function () ()
  (for-each (lambda (note)
             (let ((pitch
                    (ly:make-pitch 0 note)))
              (add-music
               (make-music 'NoteEvent
                'duration (ly:make-duration 2 0 1/1)
                'pitch pitch))
              ;;% Couldn't quite get this to work in the pdfjam --nup context:
              ;;% (add-text
              ;;% #{ \markup \fill-line { \center-column { \vspace #.8 \line { \abs-fontsize #35 #(string-upcase (note-name->string pitch)) } } } #})
))
'(1 2 3 4 5 6 7 8 9 10 11 12)))

\memo

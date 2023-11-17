%
% sudo tlmgr install pdfjam
% pdfjam --frame true --nup 3x4 --suffix '3x4' memo.pdf
%  or
% pdfjam --landscape --frame true --nup 6x2 --suffix '6x2' memo.pdf
\version "2.24.0"

\paper {
  #(set-paper-size "a10" 'landscape)
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup \null
  evenFooterMarkup = \markup \null

  top-margin = 0.5\cm
  bottom-margin = 0\cm
  left-margin = 0.15\cm
}

\layout {
  indent = 0.7\cm

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
#(define-scheme-function (with-text notes) (boolean? number-list?)
  (for-each (lambda (note)
             (let ((pitch
                    (ly:make-pitch 0 note)))
              (add-music
               #{
               {
                 \clef bass #(make-music 'NoteEvent
                              'duration (ly:make-duration 2 0 1/1)
                              'pitch pitch)
                 \once \override Staff.Clef.transparent = ##t
                 \clef treble
               }
               #})

              ;;% Couldn't quite get this to work in the pdfjam --nup context:
              (cond (with-text
                     (add-text
                      #{
                      \markup \fill-line {
                      \center-column {
                      \vspace #.8 \line {
                      \abs-fontsize #35 #(string-upcase (note-name->string pitch)) } } }
                      #})))))
   notes))

% \memo ##f #(iota 12 1)
\memo ##f #(iota 12 -12)

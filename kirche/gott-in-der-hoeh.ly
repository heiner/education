% 180.2
% Gott in der Höh sei Preis und Ehr
% Ökumenische Fassung 1971 nach >>Gloria in excelsis Deo<< 4. Jh
% Melodie: Augsburg 1659

\version "2.12.3"

#(set-default-paper-size "a5")

% No 'Music engraving by LilyPond ...'
\header {
    tagline = ##f
    title = "Gott in der Höh sei Preis und Ehr"
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

\score {
<<
  \relative c' {
    \key g \major
    \time 6/4
    \repeat volta 2
    { \partial 4*3 d4 d d | g2 g4 a2 a4 b2. \breathe
      b4 b b b2( a4) g4 a2 g2 r4 }
    b4 d4 c4 b2 b4 a2 g4 a2. \breathe
    fis4 fis fis g2( fis4) e4 e2 d2 r4
    d4 e4 fis4 g2. fis4 g4 a4 b2. \breathe
    b4 b b b2( a4) g4 a2 g2. \bar "|."
  }
  \addlyrics {
    Gott in der Höh sei Preis und Ehr, den Men -- schen
    Fried auf Er -- den.
  }
  \addlyrics {
    All -- mächt' -- ger Va -- ter, höch -- ster Herr,
    du sollst ver -- herr -- licht wer -- den.
    Herr Je -- sus Chri -- stus, Got -- tes Sohn,
    wir rüh -- men dei -- nen Na -- men;
    du wohnst mit Gott dem Heil -- gen Geist
    im Licht des Va -- ters. A -- men.
  }
>>
\layout {}
\midi {}
}

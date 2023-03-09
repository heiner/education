% Cf. https://www.sheetmusicplus.com/title/christmas-is-a-comin-may-god-bless-you-digital-sheet-music/20433773

\header {
    tagline = "(May God bless you)"
    title = \markup \center-column { \medium\larger
                                     "Christmas is A-Coming" }
    composer = "Frank Luther"
    poet = "trad. English carol"

}

\version "2.24.0"


Melody = \relative c'' {
  \time 4/4 {
    \key es \major
    g8.[ f16 g8. es16]  f8.[ d16 c8. bes16]  es8.[ d16 es8. g16]  bes2
    % - hat
    aes8.[ g16 aes8. f16] g8.[ f16 es8. g16] f4 d bes
    % if you
    \tuplet 3/2 {r8 es8 f} g8.[ f16 g8. es16] f8.[ d16 c8. bes16]
    % ha penny will do
    es8.[ d16 es8. g16] bes4
    \tuplet 3/2 {r8 g g} aes8.[ g16 aes8. f16] g8.[ es16 c8. bes16] es4 es es r4
    % God blesss you, gentlemen,
    es' c bes \tuplet 3/2 {g8 f es} aes4 c bes
    \tuplet 3/2 {r8 g8 g} aes8.[ g16 aes8. f16] g8.[ es16 c8. bes16]
    es4 es es r
    %es es es f g aes8.[ g16 aes8. f16] g8.[ es16 c8. bes16] e4 e e2
  }
}

% Lyrics are a mix of the trad. carol and the Luther song.

verse = \lyricmode {
Christ -- mas is com -- _ in', _ the geese are get -- ing fat,
Please _ put a pen -- ny in an old man's hat.
If you have -- n't got a pen -- ny, _ a ha' pen -- ny will do,
If you have -- n't got a ha' pen -- nny, then God bless you.
God bless you, gen -- tle -- men, God bless you, If you have -- n't got a ha' pen -- ny then God bless you.
God bless you.
% If you have -- n't got a thing for me, may God bless you.
}

\score {
  <<
    \new Voice = "lead" {
      \Melody
    }
    \new Lyrics \lyricsto "lead" \verse
  >>
  \layout { }
  \midi {}
}

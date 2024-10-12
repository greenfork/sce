! Solutions Consulting Enterprise © 2024 by Dmitry Matveyev is licensed under CC BY-NC-SA 4.0.
! To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/4.0/
USING: kernel namespaces math.parser accessors
raylib raylib.live-coding raylib.console
sce.resources ;
IN: sce

! Resolutions:
! 16 9 2array 50 [1..b] [ dupd v*n ] map nip .
! 240x135 * 8 = 1920x1080 -- keeping 16/9 resolution

SYMBOL: counter

: game-loop ( -- )
    counter inc

    KEY_F5 on-key-reload-code
    KEY_F10 on-key-toggle-console

    begin-drawing
        RAYWHITE clear-background
        note 10 10 64 BLACK draw-text
        draw-game-log
    end-drawing ;

: main ( -- )
    20 800 640 init-game-log
    800 640 "Raylib Live Coding Demo" init-window
    60 set-target-fps
    [ "Enabled" "Disabled" ? info ] set-after-active-toggle-hook
    0 counter set
    [ game-loop ] until-window-should-close-with-live-coding
    close-window ;

: dev ( -- )
    [ main ] with-live-coding ;

MAIN: main

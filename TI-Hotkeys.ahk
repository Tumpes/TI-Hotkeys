; Hotkey for TI-Nspire cas software
; github.com/tumpes/TI-Hotkeys

!d::
{
Send "(,)"       ; Derive function
Send "{Ctrl down}"
Send "m"          ; math mode
Send "{Ctrl up}"
Send "{Left}"     ; go left to get cursor in the default place
Send "{Left}"
}

!x::
{
Send "(,)"       ; derive and fill in x
Send "{Ctrl down}"
Send "m"          
Send "{Ctrl up}"
Send "{Left}"     ; go left to get cursor in the default place
Send "{Left}"
Send "x"
Send "{Right}"
}

!0::Send "≈"
!+0::Send "≠"
!¨::Send "↑"
!'::Send "↓"
!a::Send "α"
!b::Send "β"
!g::Send "γ"
!s::Send "Σ"
!<::Send "≤"
!z::Send "≥"
!+::Send "±"
!p::Send "π"
!o::Send "Ω"

!,::
{
MouseGetPos &xpos, &ypos 
Send "{Click 907 123}" ; click at subscript button
MouseMove xpos, ypos
}

;  :*?:pi::π ; replace pi with π. Disabled, caused some
             ; problems with words like "pieni" -> "πeni"

!h::
{
MsgBox "
  (
	Modifier for all hotkeys is alt.
Hotkeys:
    d: derive
    x: derive with dx filled
    0: ≈
    ctrl + 0: ≠
    ¨: ↑
    ': ↓
    a: α
    b: β
    g: γ
    s: Σ
    <: ≤
    z: ≥
    p: π
    o: Ω
    ,: subscript
  )", "Help" 
}

;Additional features:
    ;"pi" is replaced with "π", disabled

; ↑ ↓ α β γ ≠ Σ ≥ ≤ 
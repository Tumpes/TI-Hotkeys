; Hotkey for TI-Nspire cas software
; github.com/tumpes/TI-Hotkeys

mathMode()
{
  Send "{Ctrl down}"
  Send "m"         
  Send "{Ctrl up}"
}

!i::
{
mathMode()
Send "∫(,,,)"       ; definite Integral
mathMode()
Send "{Left}"
Send "{Left}"
Send "{Left}"       ; three times left to get cursor in the default position
}

!´::
{
Send "▶" ; unit conversion operator
}

!x::
{
mathMode()
Send "(,)"       ; derive and fill in x
mathMode()
Send "{Left}"     ; go left to get cursor in the default place
Send "{Left}"
Send "x"
Send "{Right}"
}

!d::
{
mathMode()
Send "(,)"    
mathMode()        
Send "{Left}"     ; go left to get cursor in the default place
Send "{Left}" 
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
!e::Send ""
!u::Send "μ"
^e::Send "ε"


!,::
{
MouseGetPos &xpos, &ypos 
Send "{Click 907 123}" ; click at subscript button
MouseMove xpos, ypos
}

!h::
{
MsgBox "
  (
  Hotkeys:
    alt + d: derive
    alt + x: derive with dx filled
    alt + i: definite integral
    alt + 0: ≈
    alt + ctrl + 0: ≠
    alt + ¨: ↑
    alt + ': ↓
    alt + a: α
    alt + b: β
    alt + g: γ
    alt + s: Σ
    alt + <: ≤
    alt + z: ≥
    alt + p: π
    alt + o: Ω
    alt + u: μ
    alt + ,: subscript
    alt + ´: ▶; unit conversions
    alt + e: e; neper number
    ctrl + e: ε
  )", "Help" 
}

; official nspire shortcuts available at https://education.ti.com/-/media/files/activities/us/math/international-baccalaureate/short-cuts/ti-shortcuts-and-tips.pdf
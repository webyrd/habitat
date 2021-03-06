;
;	magic_lamp_talk.m
;
;	Action code for the magic lamp 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	getProp pointed, MAGIC_LAMP_state	; Genie has to be there.
	if (!zero) {
		lda	input_text_length	; Length from input
		ldy	#MSG_WISH		; WISH request
		ldx	pointed_noid		; Sent to the lamp
		jsr	v_send_string		; Send the request
		chainTo	v_clear_text_line
	}
	ldx #0					; Talk out loud if no genie
	chainTo v_talk

	actionEnd

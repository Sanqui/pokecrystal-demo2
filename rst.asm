; rst vectors

SECTION "rst0",ROM0[0]
	di
	jp Start

SECTION "rst8",ROM0[FarCall]
	jp FarCall_hl

SECTION "rst10",ROM0[Bankswitch]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst18",ROM0[$18]
    ld [hTempA], a ; 3
	jp Rst18Cont

SECTION "rst20",ROM0[$20]
	rst $38

SECTION "rst28",ROM0[JumpTable]
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	jp [hl]

; SECTION "rst30",ROM0[$30]
; rst30 is midst rst28

SECTION "rst38",ROM0[$38]
	rst $38


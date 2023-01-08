
demoApp:     file format elf32-i386


Disassembly of section .interp:

00000154 <.interp>:
 154:	2f                   	das    
 155:	6c                   	ins    BYTE PTR es:[edi],dx
 156:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 15d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 164:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .note.ABI-tag:

00000168 <.note.ABI-tag>:
 168:	04 00                	add    al,0x0
 16a:	00 00                	add    BYTE PTR [eax],al
 16c:	10 00                	adc    BYTE PTR [eax],al
 16e:	00 00                	add    BYTE PTR [eax],al
 170:	01 00                	add    DWORD PTR [eax],eax
 172:	00 00                	add    BYTE PTR [eax],al
 174:	47                   	inc    edi
 175:	4e                   	dec    esi
 176:	55                   	push   ebp
 177:	00 00                	add    BYTE PTR [eax],al
 179:	00 00                	add    BYTE PTR [eax],al
 17b:	00 03                	add    BYTE PTR [ebx],al
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	00 02                	add    BYTE PTR [edx],al
 181:	00 00                	add    BYTE PTR [eax],al
 183:	00 00                	add    BYTE PTR [eax],al
 185:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .note.gnu.build-id:

00000188 <.note.gnu.build-id>:
 188:	04 00                	add    al,0x0
 18a:	00 00                	add    BYTE PTR [eax],al
 18c:	14 00                	adc    al,0x0
 18e:	00 00                	add    BYTE PTR [eax],al
 190:	03 00                	add    eax,DWORD PTR [eax]
 192:	00 00                	add    BYTE PTR [eax],al
 194:	47                   	inc    edi
 195:	4e                   	dec    esi
 196:	55                   	push   ebp
 197:	00 b4 db 96 ce 1e 08 	add    BYTE PTR [ebx+ebx*8+0x81ece96],dh
 19e:	20 3c 29             	and    BYTE PTR [ecx+ebp*1],bh
 1a1:	fa                   	cli    
 1a2:	32 47 b7             	xor    al,BYTE PTR [edi-0x49]
 1a5:	20 2c 29             	and    BYTE PTR [ecx+ebp*1],ch
 1a8:	4b                   	dec    ebx
 1a9:	2a                   	.byte 0x2a
 1aa:	90                   	nop
 1ab:	0e                   	push   cs

Disassembly of section .gnu.hash:

000001ac <.gnu.hash>:
 1ac:	02 00                	add    al,BYTE PTR [eax]
 1ae:	00 00                	add    BYTE PTR [eax],al
 1b0:	06                   	push   es
 1b1:	00 00                	add    BYTE PTR [eax],al
 1b3:	00 01                	add    BYTE PTR [ecx],al
 1b5:	00 00                	add    BYTE PTR [eax],al
 1b7:	00 05 00 00 00 00    	add    BYTE PTR ds:0x0,al
 1bd:	20 00                	and    BYTE PTR [eax],al
 1bf:	20 00                	and    BYTE PTR [eax],al
 1c1:	00 00                	add    BYTE PTR [eax],al
 1c3:	00 06                	add    BYTE PTR [esi],al
 1c5:	00 00                	add    BYTE PTR [eax],al
 1c7:	00                   	.byte 0x0
 1c8:	ad                   	lods   eax,DWORD PTR ds:[esi]
 1c9:	4b                   	dec    ebx
 1ca:	e3 c0                	jecxz  18c <_init-0x1cc>

Disassembly of section .dynsym:

000001cc <.dynsym>:
	...
 1dc:	51                   	push   ecx
	...
 1e5:	00 00                	add    BYTE PTR [eax],al
 1e7:	00 20                	add    BYTE PTR [eax],ah
 1e9:	00 00                	add    BYTE PTR [eax],al
 1eb:	00 1a                	add    BYTE PTR [edx],bl
	...
 1f5:	00 00                	add    BYTE PTR [eax],al
 1f7:	00 22                	add    BYTE PTR [edx],ah
 1f9:	00 00                	add    BYTE PTR [eax],al
 1fb:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
	...
 206:	00 00                	add    BYTE PTR [eax],al
 208:	20 00                	and    BYTE PTR [eax],al
 20a:	00 00                	add    BYTE PTR [eax],al
 20c:	29 00                	sub    DWORD PTR [eax],eax
	...
 216:	00 00                	add    BYTE PTR [eax],al
 218:	12 00                	adc    al,BYTE PTR [eax]
 21a:	00 00                	add    BYTE PTR [eax],al
 21c:	7c 00                	jl     21e <_init-0x13a>
	...
 226:	00 00                	add    BYTE PTR [eax],al
 228:	20 00                	and    BYTE PTR [eax],al
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	0b 00                	or     eax,DWORD PTR [eax]
 22e:	00 00                	add    BYTE PTR [eax],al
 230:	2c 06                	sub    al,0x6
 232:	00 00                	add    BYTE PTR [eax],al
 234:	04 00                	add    al,0x0
 236:	00 00                	add    BYTE PTR [eax],al
 238:	11 00                	adc    DWORD PTR [eax],eax
 23a:	10 00                	adc    BYTE PTR [eax],al

Disassembly of section .dynstr:

0000023c <.dynstr>:
 23c:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 240:	63 2e                	arpl   WORD PTR [esi],bp
 242:	73 6f                	jae    2b3 <_init-0xa5>
 244:	2e 36 00 5f 49       	cs add BYTE PTR ss:[edi+0x49],bl
 249:	4f                   	dec    edi
 24a:	5f                   	pop    edi
 24b:	73 74                	jae    2c1 <_init-0x97>
 24d:	64 69 6e 5f 75 73 65 	imul   ebp,DWORD PTR fs:[esi+0x5f],0x64657375
 254:	64 
 255:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 258:	63 78 61             	arpl   WORD PTR [eax+0x61],di
 25b:	5f                   	pop    edi
 25c:	66 69 6e 61 6c 69    	imul   bp,WORD PTR [esi+0x61],0x696c
 262:	7a 65                	jp     2c9 <_init-0x8f>
 264:	00 5f 5f             	add    BYTE PTR [edi+0x5f],bl
 267:	6c                   	ins    BYTE PTR es:[edi],dx
 268:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [edx+0x63],0x6174735f
 26f:	72 74                	jb     2e5 <_init-0x73>
 271:	5f                   	pop    edi
 272:	6d                   	ins    DWORD PTR es:[edi],dx
 273:	61                   	popa   
 274:	69 6e 00 47 4c 49 42 	imul   ebp,DWORD PTR [esi+0x0],0x42494c47
 27b:	43                   	inc    ebx
 27c:	5f                   	pop    edi
 27d:	32 2e                	xor    ch,BYTE PTR [esi]
 27f:	30 00                	xor    BYTE PTR [eax],al
 281:	47                   	inc    edi
 282:	4c                   	dec    esp
 283:	49                   	dec    ecx
 284:	42                   	inc    edx
 285:	43                   	inc    ebx
 286:	5f                   	pop    edi
 287:	32 2e                	xor    ch,BYTE PTR [esi]
 289:	31 2e                	xor    DWORD PTR [esi],ebp
 28b:	33 00                	xor    eax,DWORD PTR [eax]
 28d:	5f                   	pop    edi
 28e:	49                   	dec    ecx
 28f:	54                   	push   esp
 290:	4d                   	dec    ebp
 291:	5f                   	pop    edi
 292:	64 65 72 65          	fs gs jb 2fb <_init-0x5d>
 296:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [bp+di+0x74],0x4d547265
 29d:	4d 
 29e:	43                   	inc    ebx
 29f:	6c                   	ins    BYTE PTR es:[edi],dx
 2a0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2a1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2a2:	65 54                	gs push esp
 2a4:	61                   	popa   
 2a5:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 2a9:	5f                   	pop    edi
 2aa:	5f                   	pop    edi
 2ab:	67 6d                	ins    DWORD PTR es:[di],dx
 2ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2ae:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2af:	5f                   	pop    edi
 2b0:	73 74                	jae    326 <_init-0x32>
 2b2:	61                   	popa   
 2b3:	72 74                	jb     329 <_init-0x2f>
 2b5:	5f                   	pop    edi
 2b6:	5f                   	pop    edi
 2b7:	00 5f 49             	add    BYTE PTR [edi+0x49],bl
 2ba:	54                   	push   esp
 2bb:	4d                   	dec    ebp
 2bc:	5f                   	pop    edi
 2bd:	72 65                	jb     324 <_init-0x34>
 2bf:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [bp+di+0x74],0x4d547265
 2c6:	4d 
 2c7:	43                   	inc    ebx
 2c8:	6c                   	ins    BYTE PTR es:[edi],dx
 2c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2ca:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2cb:	65 54                	gs push esp
 2cd:	61                   	popa   
 2ce:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]

Disassembly of section .gnu.version:

000002d2 <.gnu.version>:
 2d2:	00 00                	add    BYTE PTR [eax],al
 2d4:	00 00                	add    BYTE PTR [eax],al
 2d6:	02 00                	add    al,BYTE PTR [eax]
 2d8:	00 00                	add    BYTE PTR [eax],al
 2da:	03 00                	add    eax,DWORD PTR [eax]
 2dc:	00 00                	add    BYTE PTR [eax],al
 2de:	01 00                	add    DWORD PTR [eax],eax

Disassembly of section .gnu.version_r:

000002e0 <.gnu.version_r>:
 2e0:	01 00                	add    DWORD PTR [eax],eax
 2e2:	02 00                	add    al,BYTE PTR [eax]
 2e4:	01 00                	add    DWORD PTR [eax],eax
 2e6:	00 00                	add    BYTE PTR [eax],al
 2e8:	10 00                	adc    BYTE PTR [eax],al
 2ea:	00 00                	add    BYTE PTR [eax],al
 2ec:	00 00                	add    BYTE PTR [eax],al
 2ee:	00 00                	add    BYTE PTR [eax],al
 2f0:	10 69 69             	adc    BYTE PTR [ecx+0x69],ch
 2f3:	0d 00 00 03 00       	or     eax,0x30000
 2f8:	3b 00                	cmp    eax,DWORD PTR [eax]
 2fa:	00 00                	add    BYTE PTR [eax],al
 2fc:	10 00                	adc    BYTE PTR [eax],al
 2fe:	00 00                	add    BYTE PTR [eax],al
 300:	73 1f                	jae    321 <_init-0x37>
 302:	69 09 00 00 02 00    	imul   ecx,DWORD PTR [ecx],0x20000
 308:	45                   	inc    ebp
 309:	00 00                	add    BYTE PTR [eax],al
 30b:	00 00                	add    BYTE PTR [eax],al
 30d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .rel.dyn:

00000310 <.rel.dyn>:
 310:	dc 1e                	fcomp  QWORD PTR [esi]
 312:	00 00                	add    BYTE PTR [eax],al
 314:	08 00                	or     BYTE PTR [eax],al
 316:	00 00                	add    BYTE PTR [eax],al
 318:	e0 1e                	loopne 338 <_init-0x20>
 31a:	00 00                	add    BYTE PTR [eax],al
 31c:	08 00                	or     BYTE PTR [eax],al
 31e:	00 00                	add    BYTE PTR [eax],al
 320:	f8                   	clc    
 321:	1f                   	pop    ds
 322:	00 00                	add    BYTE PTR [eax],al
 324:	08 00                	or     BYTE PTR [eax],al
 326:	00 00                	add    BYTE PTR [eax],al
 328:	04 20                	add    al,0x20
 32a:	00 00                	add    BYTE PTR [eax],al
 32c:	08 00                	or     BYTE PTR [eax],al
 32e:	00 00                	add    BYTE PTR [eax],al
 330:	ec                   	in     al,dx
 331:	1f                   	pop    ds
 332:	00 00                	add    BYTE PTR [eax],al
 334:	06                   	push   es
 335:	01 00                	add    DWORD PTR [eax],eax
 337:	00 f0                	add    al,dh
 339:	1f                   	pop    ds
 33a:	00 00                	add    BYTE PTR [eax],al
 33c:	06                   	push   es
 33d:	02 00                	add    al,BYTE PTR [eax]
 33f:	00 f4                	add    ah,dh
 341:	1f                   	pop    ds
 342:	00 00                	add    BYTE PTR [eax],al
 344:	06                   	push   es
 345:	03 00                	add    eax,DWORD PTR [eax]
 347:	00 fc                	add    ah,bh
 349:	1f                   	pop    ds
 34a:	00 00                	add    BYTE PTR [eax],al
 34c:	06                   	push   es
 34d:	05                   	.byte 0x5
	...

Disassembly of section .rel.plt:

00000350 <.rel.plt>:
 350:	e8 1f 00 00 07       	call   7000374 <_end+0x6ffe364>
 355:	04 00                	add    al,0x0
	...

Disassembly of section .init:

00000358 <_init>:
 358:	53                   	push   ebx
 359:	83 ec 08             	sub    esp,0x8
 35c:	e8 8f 00 00 00       	call   3f0 <__x86.get_pc_thunk.bx>
 361:	81 c3 7b 1c 00 00    	add    ebx,0x1c7b
 367:	8b 83 18 00 00 00    	mov    eax,DWORD PTR [ebx+0x18]
 36d:	85 c0                	test   eax,eax
 36f:	74 05                	je     376 <_init+0x1e>
 371:	e8 32 00 00 00       	call   3a8 <__gmon_start__@plt>
 376:	83 c4 08             	add    esp,0x8
 379:	5b                   	pop    ebx
 37a:	c3                   	ret    

Disassembly of section .plt:

00000380 <.plt>:
 380:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
 386:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
 38c:	00 00                	add    BYTE PTR [eax],al
	...

00000390 <__libc_start_main@plt>:
 390:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
 396:	68 00 00 00 00       	push   0x0
 39b:	e9 e0 ff ff ff       	jmp    380 <.plt>

Disassembly of section .plt.got:

000003a0 <__cxa_finalize@plt>:
 3a0:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
 3a6:	66 90                	xchg   ax,ax

000003a8 <__gmon_start__@plt>:
 3a8:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
 3ae:	66 90                	xchg   ax,ax

Disassembly of section .text:

000003b0 <_start>:
 3b0:	31 ed                	xor    ebp,ebp
 3b2:	5e                   	pop    esi
 3b3:	89 e1                	mov    ecx,esp
 3b5:	83 e4 f0             	and    esp,0xfffffff0
 3b8:	50                   	push   eax
 3b9:	54                   	push   esp
 3ba:	52                   	push   edx
 3bb:	e8 22 00 00 00       	call   3e2 <_start+0x32>
 3c0:	81 c3 1c 1c 00 00    	add    ebx,0x1c1c
 3c6:	8d 83 34 e6 ff ff    	lea    eax,[ebx-0x19cc]
 3cc:	50                   	push   eax
 3cd:	8d 83 d4 e5 ff ff    	lea    eax,[ebx-0x1a2c]
 3d3:	50                   	push   eax
 3d4:	51                   	push   ecx
 3d5:	56                   	push   esi
 3d6:	ff b3 1c 00 00 00    	push   DWORD PTR [ebx+0x1c]
 3dc:	e8 af ff ff ff       	call   390 <__libc_start_main@plt>
 3e1:	f4                   	hlt    
 3e2:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 3e5:	c3                   	ret    
 3e6:	66 90                	xchg   ax,ax
 3e8:	66 90                	xchg   ax,ax
 3ea:	66 90                	xchg   ax,ax
 3ec:	66 90                	xchg   ax,ax
 3ee:	66 90                	xchg   ax,ax

000003f0 <__x86.get_pc_thunk.bx>:
 3f0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 3f3:	c3                   	ret    
 3f4:	66 90                	xchg   ax,ax
 3f6:	66 90                	xchg   ax,ax
 3f8:	66 90                	xchg   ax,ax
 3fa:	66 90                	xchg   ax,ax
 3fc:	66 90                	xchg   ax,ax
 3fe:	66 90                	xchg   ax,ax

00000400 <deregister_tm_clones>:
 400:	e8 e4 00 00 00       	call   4e9 <__x86.get_pc_thunk.dx>
 405:	81 c2 d7 1b 00 00    	add    edx,0x1bd7
 40b:	8d 8a 2c 00 00 00    	lea    ecx,[edx+0x2c]
 411:	8d 82 2c 00 00 00    	lea    eax,[edx+0x2c]
 417:	39 c8                	cmp    eax,ecx
 419:	74 1d                	je     438 <deregister_tm_clones+0x38>
 41b:	8b 82 10 00 00 00    	mov    eax,DWORD PTR [edx+0x10]
 421:	85 c0                	test   eax,eax
 423:	74 13                	je     438 <deregister_tm_clones+0x38>
 425:	55                   	push   ebp
 426:	89 e5                	mov    ebp,esp
 428:	83 ec 14             	sub    esp,0x14
 42b:	51                   	push   ecx
 42c:	ff d0                	call   eax
 42e:	83 c4 10             	add    esp,0x10
 431:	c9                   	leave  
 432:	c3                   	ret    
 433:	90                   	nop
 434:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 438:	f3 c3                	repz ret 
 43a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00000440 <register_tm_clones>:
 440:	e8 a4 00 00 00       	call   4e9 <__x86.get_pc_thunk.dx>
 445:	81 c2 97 1b 00 00    	add    edx,0x1b97
 44b:	55                   	push   ebp
 44c:	8d 8a 2c 00 00 00    	lea    ecx,[edx+0x2c]
 452:	8d 82 2c 00 00 00    	lea    eax,[edx+0x2c]
 458:	29 c8                	sub    eax,ecx
 45a:	89 e5                	mov    ebp,esp
 45c:	53                   	push   ebx
 45d:	c1 f8 02             	sar    eax,0x2
 460:	89 c3                	mov    ebx,eax
 462:	83 ec 04             	sub    esp,0x4
 465:	c1 eb 1f             	shr    ebx,0x1f
 468:	01 d8                	add    eax,ebx
 46a:	d1 f8                	sar    eax,1
 46c:	74 14                	je     482 <register_tm_clones+0x42>
 46e:	8b 92 20 00 00 00    	mov    edx,DWORD PTR [edx+0x20]
 474:	85 d2                	test   edx,edx
 476:	74 0a                	je     482 <register_tm_clones+0x42>
 478:	83 ec 08             	sub    esp,0x8
 47b:	50                   	push   eax
 47c:	51                   	push   ecx
 47d:	ff d2                	call   edx
 47f:	83 c4 10             	add    esp,0x10
 482:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 485:	c9                   	leave  
 486:	c3                   	ret    
 487:	89 f6                	mov    esi,esi
 489:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00000490 <__do_global_dtors_aux>:
 490:	55                   	push   ebp
 491:	89 e5                	mov    ebp,esp
 493:	53                   	push   ebx
 494:	e8 57 ff ff ff       	call   3f0 <__x86.get_pc_thunk.bx>
 499:	81 c3 43 1b 00 00    	add    ebx,0x1b43
 49f:	83 ec 04             	sub    esp,0x4
 4a2:	80 bb 2c 00 00 00 00 	cmp    BYTE PTR [ebx+0x2c],0x0
 4a9:	75 27                	jne    4d2 <__do_global_dtors_aux+0x42>
 4ab:	8b 83 14 00 00 00    	mov    eax,DWORD PTR [ebx+0x14]
 4b1:	85 c0                	test   eax,eax
 4b3:	74 11                	je     4c6 <__do_global_dtors_aux+0x36>
 4b5:	83 ec 0c             	sub    esp,0xc
 4b8:	ff b3 28 00 00 00    	push   DWORD PTR [ebx+0x28]
 4be:	e8 dd fe ff ff       	call   3a0 <__cxa_finalize@plt>
 4c3:	83 c4 10             	add    esp,0x10
 4c6:	e8 35 ff ff ff       	call   400 <deregister_tm_clones>
 4cb:	c6 83 2c 00 00 00 01 	mov    BYTE PTR [ebx+0x2c],0x1
 4d2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 4d5:	c9                   	leave  
 4d6:	c3                   	ret    
 4d7:	89 f6                	mov    esi,esi
 4d9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

000004e0 <frame_dummy>:
 4e0:	55                   	push   ebp
 4e1:	89 e5                	mov    ebp,esp
 4e3:	5d                   	pop    ebp
 4e4:	e9 57 ff ff ff       	jmp    440 <register_tm_clones>

000004e9 <__x86.get_pc_thunk.dx>:
 4e9:	8b 14 24             	mov    edx,DWORD PTR [esp]
 4ec:	c3                   	ret    

000004ed <add>:
 4ed:	55                   	push   ebp
 4ee:	89 e5                	mov    ebp,esp
 4f0:	83 ec 10             	sub    esp,0x10
 4f3:	e8 52 00 00 00       	call   54a <__x86.get_pc_thunk.ax>
 4f8:	05 e4 1a 00 00       	add    eax,0x1ae4
 4fd:	d9 45 08             	fld    DWORD PTR [ebp+0x8]
 500:	d8 45 0c             	fadd   DWORD PTR [ebp+0xc]
 503:	d9 5d fc             	fstp   DWORD PTR [ebp-0x4]
 506:	d9 45 fc             	fld    DWORD PTR [ebp-0x4]
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <add_and_mulitply>:
 50b:	55                   	push   ebp
 50c:	89 e5                	mov    ebp,esp
 50e:	53                   	push   ebx
 50f:	83 ec 14             	sub    esp,0x14
 512:	e8 d9 fe ff ff       	call   3f0 <__x86.get_pc_thunk.bx>
 517:	81 c3 c5 1a 00 00    	add    ebx,0x1ac5
 51d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 520:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 523:	e8 c5 ff ff ff       	call   4ed <add>
 528:	83 c4 08             	add    esp,0x8
 52b:	d9 5d e8             	fstp   DWORD PTR [ebp-0x18]
 52e:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 531:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
 534:	d9 45 f8             	fld    DWORD PTR [ebp-0x8]
 537:	d9 83 54 e6 ff ff    	fld    DWORD PTR [ebx-0x19ac]
 53d:	de c9                	fmulp  st(1),st
 53f:	d9 5d f8             	fstp   DWORD PTR [ebp-0x8]
 542:	d9 45 f8             	fld    DWORD PTR [ebp-0x8]
 545:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 548:	c9                   	leave  
 549:	c3                   	ret    

0000054a <__x86.get_pc_thunk.ax>:
 54a:	8b 04 24             	mov    eax,DWORD PTR [esp]
 54d:	c3                   	ret    

0000054e <main>:
 54e:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 552:	83 e4 f0             	and    esp,0xfffffff0
 555:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 558:	55                   	push   ebp
 559:	89 e5                	mov    ebp,esp
 55b:	53                   	push   ebx
 55c:	51                   	push   ecx
 55d:	83 ec 20             	sub    esp,0x20
 560:	e8 8b fe ff ff       	call   3f0 <__x86.get_pc_thunk.bx>
 565:	81 c3 77 1a 00 00    	add    ebx,0x1a77
 56b:	d9 e8                	fld1   
 56d:	d9 5d ec             	fstp   DWORD PTR [ebp-0x14]
 570:	d9 83 58 e6 ff ff    	fld    DWORD PTR [ebx-0x19a8]
 576:	d9 5d f0             	fstp   DWORD PTR [ebp-0x10]
 579:	83 ec 08             	sub    esp,0x8
 57c:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 57f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 582:	e8 84 ff ff ff       	call   50b <add_and_mulitply>
 587:	83 c4 10             	add    esp,0x10
 58a:	d9 5d e4             	fstp   DWORD PTR [ebp-0x1c]
 58d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 590:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 593:	8d 83 30 00 00 00    	lea    eax,[ebx+0x30]
 599:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
 59f:	b8 00 00 00 00       	mov    eax,0x0
 5a4:	8d 65 f8             	lea    esp,[ebp-0x8]
 5a7:	59                   	pop    ecx
 5a8:	5b                   	pop    ebx
 5a9:	5d                   	pop    ebp
 5aa:	8d 61 fc             	lea    esp,[ecx-0x4]
 5ad:	c3                   	ret    
 5ae:	66 90                	xchg   ax,ax

000005b0 <__libc_csu_init>:
 5b0:	55                   	push   ebp
 5b1:	57                   	push   edi
 5b2:	56                   	push   esi
 5b3:	53                   	push   ebx
 5b4:	e8 37 fe ff ff       	call   3f0 <__x86.get_pc_thunk.bx>
 5b9:	81 c3 23 1a 00 00    	add    ebx,0x1a23
 5bf:	83 ec 0c             	sub    esp,0xc
 5c2:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 5c6:	8d b3 04 ff ff ff    	lea    esi,[ebx-0xfc]
 5cc:	e8 87 fd ff ff       	call   358 <_init>
 5d1:	8d 83 00 ff ff ff    	lea    eax,[ebx-0x100]
 5d7:	29 c6                	sub    esi,eax
 5d9:	c1 fe 02             	sar    esi,0x2
 5dc:	85 f6                	test   esi,esi
 5de:	74 25                	je     605 <__libc_csu_init+0x55>
 5e0:	31 ff                	xor    edi,edi
 5e2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 5e8:	83 ec 04             	sub    esp,0x4
 5eb:	55                   	push   ebp
 5ec:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 5f0:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 5f4:	ff 94 bb 00 ff ff ff 	call   DWORD PTR [ebx+edi*4-0x100]
 5fb:	83 c7 01             	add    edi,0x1
 5fe:	83 c4 10             	add    esp,0x10
 601:	39 fe                	cmp    esi,edi
 603:	75 e3                	jne    5e8 <__libc_csu_init+0x38>
 605:	83 c4 0c             	add    esp,0xc
 608:	5b                   	pop    ebx
 609:	5e                   	pop    esi
 60a:	5f                   	pop    edi
 60b:	5d                   	pop    ebp
 60c:	c3                   	ret    
 60d:	8d 76 00             	lea    esi,[esi+0x0]

00000610 <__libc_csu_fini>:
 610:	f3 c3                	repz ret 

Disassembly of section .fini:

00000614 <_fini>:
 614:	53                   	push   ebx
 615:	83 ec 08             	sub    esp,0x8
 618:	e8 d3 fd ff ff       	call   3f0 <__x86.get_pc_thunk.bx>
 61d:	81 c3 bf 19 00 00    	add    ebx,0x19bf
 623:	83 c4 08             	add    esp,0x8
 626:	5b                   	pop    ebx
 627:	c3                   	ret    

Disassembly of section .rodata:

00000628 <_fp_hw>:
 628:	03 00                	add    eax,DWORD PTR [eax]
	...

0000062c <_IO_stdin_used>:
 62c:	01 00                	add    DWORD PTR [eax],eax
 62e:	02 00                	add    al,BYTE PTR [eax]
 630:	00 00                	add    BYTE PTR [eax],al
 632:	40                   	inc    eax
 633:	40                   	inc    eax
 634:	00 00                	add    BYTE PTR [eax],al
 636:	a0                   	.byte 0xa0
 637:	40                   	inc    eax

Disassembly of section .eh_frame_hdr:

00000638 <__GNU_EH_FRAME_HDR>:
 638:	01 1b                	add    DWORD PTR [ebx],ebx
 63a:	03 3b                	add    edi,DWORD PTR [ebx]
 63c:	48                   	dec    eax
 63d:	00 00                	add    BYTE PTR [eax],al
 63f:	00 08                	add    BYTE PTR [eax],cl
 641:	00 00                	add    BYTE PTR [eax],al
 643:	00 48 fd             	add    BYTE PTR [eax-0x3],cl
 646:	ff                   	(bad)  
 647:	ff 64 00 00          	jmp    DWORD PTR [eax+eax*1+0x0]
 64b:	00 68 fd             	add    BYTE PTR [eax-0x3],ch
 64e:	ff                   	(bad)  
 64f:	ff 88 00 00 00 b5    	dec    DWORD PTR [eax-0x4b000000]
 655:	fe                   	(bad)  
 656:	ff                   	(bad)  
 657:	ff 9c 00 00 00 d3 fe 	call   FWORD PTR [eax+eax*1-0x12d0000]
 65e:	ff                   	(bad)  
 65f:	ff                   	(bad)  
 660:	bc 00 00 00 12       	mov    esp,0x12000000
 665:	ff                   	(bad)  
 666:	ff                   	(bad)  
 667:	ff e0                	jmp    eax
 669:	00 00                	add    BYTE PTR [eax],al
 66b:	00 16                	add    BYTE PTR [esi],dl
 66d:	ff                   	(bad)  
 66e:	ff                   	(bad)  
 66f:	ff f4                	push   esp
 671:	00 00                	add    BYTE PTR [eax],al
 673:	00 78 ff             	add    BYTE PTR [eax-0x1],bh
 676:	ff                   	(bad)  
 677:	ff 28                	jmp    FWORD PTR [eax]
 679:	01 00                	add    DWORD PTR [eax],eax
 67b:	00 d8                	add    al,bl
 67d:	ff                   	(bad)  
 67e:	ff                   	(bad)  
 67f:	ff 74 01 00          	push   DWORD PTR [ecx+eax*1+0x0]
	...

Disassembly of section .eh_frame:

00000684 <__FRAME_END__-0x13c>:
 684:	14 00                	adc    al,0x0
 686:	00 00                	add    BYTE PTR [eax],al
 688:	00 00                	add    BYTE PTR [eax],al
 68a:	00 00                	add    BYTE PTR [eax],al
 68c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 68f:	00 01                	add    BYTE PTR [ecx],al
 691:	7c 08                	jl     69b <__GNU_EH_FRAME_HDR+0x63>
 693:	01 1b                	add    DWORD PTR [ebx],ebx
 695:	0c 04                	or     al,0x4
 697:	04 88                	add    al,0x88
 699:	01 00                	add    DWORD PTR [eax],eax
 69b:	00 20                	add    BYTE PTR [eax],ah
 69d:	00 00                	add    BYTE PTR [eax],al
 69f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 6a2:	00 00                	add    BYTE PTR [eax],al
 6a4:	dc fc                	fdivr  st(4),st
 6a6:	ff                   	(bad)  
 6a7:	ff 20                	jmp    DWORD PTR [eax]
 6a9:	00 00                	add    BYTE PTR [eax],al
 6ab:	00 00                	add    BYTE PTR [eax],al
 6ad:	0e                   	push   cs
 6ae:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 6b1:	0c 4a                	or     al,0x4a
 6b3:	0f 0b                	ud2    
 6b5:	74 04                	je     6bb <__GNU_EH_FRAME_HDR+0x83>
 6b7:	78 00                	js     6b9 <__GNU_EH_FRAME_HDR+0x81>
 6b9:	3f                   	aas    
 6ba:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 6bc:	2a 32                	sub    dh,BYTE PTR [edx]
 6be:	24 22                	and    al,0x22
 6c0:	10 00                	adc    BYTE PTR [eax],al
 6c2:	00 00                	add    BYTE PTR [eax],al
 6c4:	40                   	inc    eax
 6c5:	00 00                	add    BYTE PTR [eax],al
 6c7:	00 d8                	add    al,bl
 6c9:	fc                   	cld    
 6ca:	ff                   	(bad)  
 6cb:	ff 10                	call   DWORD PTR [eax]
 6cd:	00 00                	add    BYTE PTR [eax],al
 6cf:	00 00                	add    BYTE PTR [eax],al
 6d1:	00 00                	add    BYTE PTR [eax],al
 6d3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 6d6:	00 00                	add    BYTE PTR [eax],al
 6d8:	54                   	push   esp
 6d9:	00 00                	add    BYTE PTR [eax],al
 6db:	00 11                	add    BYTE PTR [ecx],dl
 6dd:	fe                   	(bad)  
 6de:	ff                   	(bad)  
 6df:	ff 1e                	call   FWORD PTR [esi]
 6e1:	00 00                	add    BYTE PTR [eax],al
 6e3:	00 00                	add    BYTE PTR [eax],al
 6e5:	41                   	inc    ecx
 6e6:	0e                   	push   cs
 6e7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 6ed:	5a                   	pop    edx
 6ee:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 6f1:	04 00                	add    al,0x0
 6f3:	00 20                	add    BYTE PTR [eax],ah
 6f5:	00 00                	add    BYTE PTR [eax],al
 6f7:	00 74 00 00          	add    BYTE PTR [eax+eax*1+0x0],dh
 6fb:	00 0f                	add    BYTE PTR [edi],cl
 6fd:	fe                   	(bad)  
 6fe:	ff                   	(bad)  
 6ff:	ff                   	(bad)  
 700:	3f                   	aas    
 701:	00 00                	add    BYTE PTR [eax],al
 703:	00 00                	add    BYTE PTR [eax],al
 705:	41                   	inc    ecx
 706:	0e                   	push   cs
 707:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 70d:	44                   	inc    esp
 70e:	83 03 77             	add    DWORD PTR [ebx],0x77
 711:	c5 c3 0c             	(bad)  
 714:	04 04                	add    al,0x4
 716:	00 00                	add    BYTE PTR [eax],al
 718:	10 00                	adc    BYTE PTR [eax],al
 71a:	00 00                	add    BYTE PTR [eax],al
 71c:	98                   	cwde   
 71d:	00 00                	add    BYTE PTR [eax],al
 71f:	00 2a                	add    BYTE PTR [edx],ch
 721:	fe                   	(bad)  
 722:	ff                   	(bad)  
 723:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
 726:	00 00                	add    BYTE PTR [eax],al
 728:	00 00                	add    BYTE PTR [eax],al
 72a:	00 00                	add    BYTE PTR [eax],al
 72c:	30 00                	xor    BYTE PTR [eax],al
 72e:	00 00                	add    BYTE PTR [eax],al
 730:	ac                   	lods   al,BYTE PTR ds:[esi]
 731:	00 00                	add    BYTE PTR [eax],al
 733:	00 1a                	add    BYTE PTR [edx],bl
 735:	fe                   	(bad)  
 736:	ff                   	(bad)  
 737:	ff 60 00             	jmp    DWORD PTR [eax+0x0]
 73a:	00 00                	add    BYTE PTR [eax],al
 73c:	00 44 0c 01          	add    BYTE PTR [esp+ecx*1+0x1],al
 740:	00 47 10             	add    BYTE PTR [edi+0x10],al
 743:	05 02 75 00 44       	add    eax,0x44007502
 748:	0f 03 75 78          	lsl    esi,WORD PTR [ebp+0x78]
 74c:	06                   	push   es
 74d:	10 03                	adc    BYTE PTR [ebx],al
 74f:	02 75 7c             	add    dh,BYTE PTR [ebp+0x7c]
 752:	02 4b c1             	add    cl,BYTE PTR [ebx-0x3f]
 755:	0c 01                	or     al,0x1
 757:	00 41 c3             	add    BYTE PTR [ecx-0x3d],al
 75a:	41                   	inc    ecx
 75b:	c5 43 0c             	lds    eax,FWORD PTR [ebx+0xc]
 75e:	04 04                	add    al,0x4
 760:	48                   	dec    eax
 761:	00 00                	add    BYTE PTR [eax],al
 763:	00 e0                	add    al,ah
 765:	00 00                	add    BYTE PTR [eax],al
 767:	00 48 fe             	add    BYTE PTR [eax-0x2],cl
 76a:	ff                   	(bad)  
 76b:	ff 5d 00             	call   FWORD PTR [ebp+0x0]
 76e:	00 00                	add    BYTE PTR [eax],al
 770:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 773:	08 85 02 41 0e 0c    	or     BYTE PTR [ebp+0xc0e4102],al
 779:	87 03                	xchg   DWORD PTR [ebx],eax
 77b:	41                   	inc    ecx
 77c:	0e                   	push   cs
 77d:	10 86 04 41 0e 14    	adc    BYTE PTR [esi+0x140e4104],al
 783:	83 05 4e 0e 20 69 0e 	add    DWORD PTR ds:0x69200e4e,0xe
 78a:	24 41                	and    al,0x41
 78c:	0e                   	push   cs
 78d:	28 44 0e 2c          	sub    BYTE PTR [esi+ecx*1+0x2c],al
 791:	44                   	inc    esp
 792:	0e                   	push   cs
 793:	30 4d 0e             	xor    BYTE PTR [ebp+0xe],cl
 796:	20 47 0e             	and    BYTE PTR [edi+0xe],al
 799:	14 41                	adc    al,0x41
 79b:	c3                   	ret    
 79c:	0e                   	push   cs
 79d:	10 41 c6             	adc    BYTE PTR [ecx-0x3a],al
 7a0:	0e                   	push   cs
 7a1:	0c 41                	or     al,0x41
 7a3:	c7                   	(bad)  
 7a4:	0e                   	push   cs
 7a5:	08 41 c5             	or     BYTE PTR [ecx-0x3b],al
 7a8:	0e                   	push   cs
 7a9:	04 00                	add    al,0x0
 7ab:	00 10                	add    BYTE PTR [eax],dl
 7ad:	00 00                	add    BYTE PTR [eax],al
 7af:	00 2c 01             	add    BYTE PTR [ecx+eax*1],ch
 7b2:	00 00                	add    BYTE PTR [eax],al
 7b4:	5c                   	pop    esp
 7b5:	fe                   	(bad)  
 7b6:	ff                   	(bad)  
 7b7:	ff 02                	inc    DWORD PTR [edx]
 7b9:	00 00                	add    BYTE PTR [eax],al
 7bb:	00 00                	add    BYTE PTR [eax],al
 7bd:	00 00                	add    BYTE PTR [eax],al
	...

000007c0 <__FRAME_END__>:
 7c0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .init_array:

00001edc <__frame_dummy_init_array_entry>:
    1edc:	e0 04                	loopne 1ee2 <__init_array_end+0x2>
	...

Disassembly of section .fini_array:

00001ee0 <__do_global_dtors_aux_fini_array_entry>:
    1ee0:	90                   	nop
    1ee1:	04 00                	add    al,0x0
	...

Disassembly of section .dynamic:

00001ee4 <_DYNAMIC>:
    1ee4:	01 00                	add    DWORD PTR [eax],eax
    1ee6:	00 00                	add    BYTE PTR [eax],al
    1ee8:	01 00                	add    DWORD PTR [eax],eax
    1eea:	00 00                	add    BYTE PTR [eax],al
    1eec:	0c 00                	or     al,0x0
    1eee:	00 00                	add    BYTE PTR [eax],al
    1ef0:	58                   	pop    eax
    1ef1:	03 00                	add    eax,DWORD PTR [eax]
    1ef3:	00 0d 00 00 00 14    	add    BYTE PTR ds:0x14000000,cl
    1ef9:	06                   	push   es
    1efa:	00 00                	add    BYTE PTR [eax],al
    1efc:	19 00                	sbb    DWORD PTR [eax],eax
    1efe:	00 00                	add    BYTE PTR [eax],al
    1f00:	dc 1e                	fcomp  QWORD PTR [esi]
    1f02:	00 00                	add    BYTE PTR [eax],al
    1f04:	1b 00                	sbb    eax,DWORD PTR [eax]
    1f06:	00 00                	add    BYTE PTR [eax],al
    1f08:	04 00                	add    al,0x0
    1f0a:	00 00                	add    BYTE PTR [eax],al
    1f0c:	1a 00                	sbb    al,BYTE PTR [eax]
    1f0e:	00 00                	add    BYTE PTR [eax],al
    1f10:	e0 1e                	loopne 1f30 <_DYNAMIC+0x4c>
    1f12:	00 00                	add    BYTE PTR [eax],al
    1f14:	1c 00                	sbb    al,0x0
    1f16:	00 00                	add    BYTE PTR [eax],al
    1f18:	04 00                	add    al,0x0
    1f1a:	00 00                	add    BYTE PTR [eax],al
    1f1c:	f5                   	cmc    
    1f1d:	fe                   	(bad)  
    1f1e:	ff 6f ac             	jmp    FWORD PTR [edi-0x54]
    1f21:	01 00                	add    DWORD PTR [eax],eax
    1f23:	00 05 00 00 00 3c    	add    BYTE PTR ds:0x3c000000,al
    1f29:	02 00                	add    al,BYTE PTR [eax]
    1f2b:	00 06                	add    BYTE PTR [esi],al
    1f2d:	00 00                	add    BYTE PTR [eax],al
    1f2f:	00 cc                	add    ah,cl
    1f31:	01 00                	add    DWORD PTR [eax],eax
    1f33:	00 0a                	add    BYTE PTR [edx],cl
    1f35:	00 00                	add    BYTE PTR [eax],al
    1f37:	00 96 00 00 00 0b    	add    BYTE PTR [esi+0xb000000],dl
    1f3d:	00 00                	add    BYTE PTR [eax],al
    1f3f:	00 10                	add    BYTE PTR [eax],dl
    1f41:	00 00                	add    BYTE PTR [eax],al
    1f43:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
    1f49:	00 00                	add    BYTE PTR [eax],al
    1f4b:	00 03                	add    BYTE PTR [ebx],al
    1f4d:	00 00                	add    BYTE PTR [eax],al
    1f4f:	00 dc                	add    ah,bl
    1f51:	1f                   	pop    ds
    1f52:	00 00                	add    BYTE PTR [eax],al
    1f54:	02 00                	add    al,BYTE PTR [eax]
    1f56:	00 00                	add    BYTE PTR [eax],al
    1f58:	08 00                	or     BYTE PTR [eax],al
    1f5a:	00 00                	add    BYTE PTR [eax],al
    1f5c:	14 00                	adc    al,0x0
    1f5e:	00 00                	add    BYTE PTR [eax],al
    1f60:	11 00                	adc    DWORD PTR [eax],eax
    1f62:	00 00                	add    BYTE PTR [eax],al
    1f64:	17                   	pop    ss
    1f65:	00 00                	add    BYTE PTR [eax],al
    1f67:	00 50 03             	add    BYTE PTR [eax+0x3],dl
    1f6a:	00 00                	add    BYTE PTR [eax],al
    1f6c:	11 00                	adc    DWORD PTR [eax],eax
    1f6e:	00 00                	add    BYTE PTR [eax],al
    1f70:	10 03                	adc    BYTE PTR [ebx],al
    1f72:	00 00                	add    BYTE PTR [eax],al
    1f74:	12 00                	adc    al,BYTE PTR [eax]
    1f76:	00 00                	add    BYTE PTR [eax],al
    1f78:	40                   	inc    eax
    1f79:	00 00                	add    BYTE PTR [eax],al
    1f7b:	00 13                	add    BYTE PTR [ebx],dl
    1f7d:	00 00                	add    BYTE PTR [eax],al
    1f7f:	00 08                	add    BYTE PTR [eax],cl
    1f81:	00 00                	add    BYTE PTR [eax],al
    1f83:	00 1e                	add    BYTE PTR [esi],bl
    1f85:	00 00                	add    BYTE PTR [eax],al
    1f87:	00 08                	add    BYTE PTR [eax],cl
    1f89:	00 00                	add    BYTE PTR [eax],al
    1f8b:	00 fb                	add    bl,bh
    1f8d:	ff                   	(bad)  
    1f8e:	ff 6f 01             	jmp    FWORD PTR [edi+0x1]
    1f91:	00 00                	add    BYTE PTR [eax],al
    1f93:	08 fe                	or     dh,bh
    1f95:	ff                   	(bad)  
    1f96:	ff 6f e0             	jmp    FWORD PTR [edi-0x20]
    1f99:	02 00                	add    al,BYTE PTR [eax]
    1f9b:	00 ff                	add    bh,bh
    1f9d:	ff                   	(bad)  
    1f9e:	ff 6f 01             	jmp    FWORD PTR [edi+0x1]
    1fa1:	00 00                	add    BYTE PTR [eax],al
    1fa3:	00 f0                	add    al,dh
    1fa5:	ff                   	(bad)  
    1fa6:	ff 6f d2             	jmp    FWORD PTR [edi-0x2e]
    1fa9:	02 00                	add    al,BYTE PTR [eax]
    1fab:	00 fa                	add    dl,bh
    1fad:	ff                   	(bad)  
    1fae:	ff 6f 04             	jmp    FWORD PTR [edi+0x4]
	...

Disassembly of section .got:

00001fdc <_GLOBAL_OFFSET_TABLE_>:
    1fdc:	e4 1e                	in     al,0x1e
	...
    1fe6:	00 00                	add    BYTE PTR [eax],al
    1fe8:	96                   	xchg   esi,eax
    1fe9:	03 00                	add    eax,DWORD PTR [eax]
	...
    1ff7:	00 4e 05             	add    BYTE PTR [esi+0x5],cl
    1ffa:	00 00                	add    BYTE PTR [eax],al
    1ffc:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .data:

00002000 <__data_start>:
    2000:	00 00                	add    BYTE PTR [eax],al
	...

00002004 <__dso_handle>:
    2004:	04 20                	add    al,0x20
	...

Disassembly of section .bss:

00002008 <__bss_start>:
    2008:	00 00                	add    BYTE PTR [eax],al
	...

0000200c <nCompletionStatus>:
    200c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    edi
   1:	43                   	inc    ebx
   2:	43                   	inc    ebx
   3:	3a 20                	cmp    ah,BYTE PTR [eax]
   5:	28 55 62             	sub    BYTE PTR [ebp+0x62],dl
   8:	75 6e                	jne    78 <_init-0x2e0>
   a:	74 75                	je     81 <_init-0x2d7>
   c:	20 37                	and    BYTE PTR [edi],dh
   e:	2e 35 2e 30 2d 33    	cs xor eax,0x332d302e
  14:	75 62                	jne    78 <_init-0x2e0>
  16:	75 6e                	jne    86 <_init-0x2d2>
  18:	74 75                	je     8f <_init-0x2c9>
  1a:	31 7e 31             	xor    DWORD PTR [esi+0x31],edi
  1d:	38 2e                	cmp    BYTE PTR [esi],ch
  1f:	30 34 29             	xor    BYTE PTR [ecx+ebp*1],dh
  22:	20 37                	and    BYTE PTR [edi],dh
  24:	2e                   	cs
  25:	35                   	.byte 0x35
  26:	2e 30 00             	xor    BYTE PTR cs:[eax],al

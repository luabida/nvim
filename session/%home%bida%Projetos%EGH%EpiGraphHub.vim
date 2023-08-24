let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projetos/EGH/EpiGraphHub
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +10 conda/superset.yaml
badd +1 containers/compose-dev.yaml
badd +8 containers/compose-base.yaml
badd +116 containers/superset/superset_config.py
badd +13 scripts/prepare-host.sh
badd +48 .env
badd +440 ~/.cache/pyright-python/1.1.324/node_modules/pyright/dist/typeshed-fallback/stdlib/builtins.pyi
badd +14 containers/airflow/Dockerfile
badd +35 containers/superset/Dockerfile
badd +10 scripts/dev/create-s3-credential.sh
badd +33 containers/superset/superset.sh
argglobal
%argdel
edit containers/superset/superset.sh
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 30 + 24) / 49)
exe '2resize ' . ((&lines * 17 + 24) / 49)
argglobal
balt containers/superset/Dockerfile
let s:l = 27 - ((7 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 27
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify(".env", ":p")) | buffer .env | else | edit .env | endif
if &buftype ==# 'terminal'
  silent file .env
endif
balt containers/compose-base.yaml
let s:l = 48 - ((7 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 48
normal! 029|
wincmd w
exe '1resize ' . ((&lines * 30 + 24) / 49)
exe '2resize ' . ((&lines * 17 + 24) / 49)
if exists(':tcd') == 2 | tcd ~/Projetos/EGH/EpiGraphHub | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

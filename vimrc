filetype off                  " required

" Bundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=/home/bruno/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/bruno/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Vimproc Build
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" My Bundles here:
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'gitignore'
NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'oblitum/rainbow'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'rking/ag.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'twerth/ir_black'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tir_black'
NeoBundle 'othree/javascript-libraries-syntax.vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax enable
set hidden
let mapleader=","
let NERDTreeHijackNetrw=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_theme = 'solarized'
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
let g:instant_markdown_autostart = 0
" let g:solarized_termtrans = 1
let g:unite_source_rec_async_command =
            \ 'ag --follow --nocolor --nogroup --hidden -g ""'
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:NERDTreeRespectWildIgnore = 1
let g:used_javascript_libs = 'angularjs, angularui, jasmine'
" let g:rainbow_ctermfgs = ['red', 'darkyellow', 'darkgreen', 'darkblue', 'magenta', 'darkmagenta', 'darkred']
" set t_Co=256
set background=dark
colorscheme gruvbox

" NeoComplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" NeoSnippets
" Plugin key-mappings.
" Expand on space
imap <expr><Space>  neosnippet#expandable() ? "\<Plug>(neosnippet_expand)"  : "\<Space>"
smap <TAB>     <Plug>(neosnippet_expand_or_jump)
xmap <C-K>     <Plug>(neosnippet_expand_target)
imap <leader><Tab> <Plug>(neosnippet_jump_or_expand)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)"
"   \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"   \ "\<Plug>(neosnippet_expand_or_jump)"
"   \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set showmatch
set autoindent
set copyindent
set pastetoggle=<F2>
set shiftround

" Interactions
set scrolloff=5
set sidescrolloff=5
set sidescroll=1
set backspace=indent,eol,start

set laststatus=2
set noshowmode
set showcmd
set modeline
set ruler
set title
set nobackup
set number
set relativenumber
hi cursorlinenr ctermfg=darkyellow
set numberwidth=1

if exists("+colorcolumn")
  set colorcolumn=81
endif

set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set eol

" Auto functions
au BufWritePost * FixWhitespace
au FileType javascript,json call rainbow#load()
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Profile0/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Profile0/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Profile0/cursor_shape block"
endif

" RXVT cursor shape
if &term =~ 'rxvt'
  if exists($TMUX)
    let &t_SI = "\<Esc>Ptmux;\<Esc>[4 q"
    let &t_EI = "\<Esc>Ptmux;\<Esc>[2 q"
  else
    " solid underscore
    let &t_SI .= "\<Esc>[4 q"
    " solid block
    let &t_EI .= "\<Esc>[2 q"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
  endif
endif

" Remaps
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])

call togglebg#map("<F5>")
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>so :so $MYVIMRC<CR>
inoremap jj <Esc>
nnoremap ç ;
nnoremap Ç :
nnoremap <Leader>ss :split <CR>
nnoremap <Leader>sv :vsplit <CR>
nnoremap <Leader>bd :bd <CR>
nnoremap <Leader>bp :bp <CR>
nnoremap <Leader>bn :bn <CR>
nnoremap <Leader>b :Unite -quick-match buffer <CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" Emmet and NeoSnippets on TAB
function! s:expand_html_tab()
  " first try to expand any neosnippets
  if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif

  " try to determine if we're within quotes or tags.
  " if so, assume we're in an emmet fill area.
  let line = getline('.')
  if col('.') < len(line)
    let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')

    if len(line) >= 2
      return "\<C-y>n"
    endif
  endif

  " go to next item in a popup menu.
  " this will insert a snippet if it's selected in the menu
  " due to neosnippets being the first check.
  if pumvisible()
    return "\<C-n>"
  endif

  " expand anything emmet thinks is expandable.
  " I'm not sure anything happens below this block.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif

  " return a regular tab character
  return "\<tab>"
endfunction

autocmd FileType html imap <buffer><expr><tab> <sid>expand_html_tab()

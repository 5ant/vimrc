
"**********************************************************************************
"         FILE:  .vimrc
"  DESCRIPTION:  the config for c/php/html/js/css lang develop by peakzhao 
"**********************************************************************************=
"
"**********************
" GENERAL SETTINGS    *
"**********************

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 

if has('gui_running') || has ('win32') 
    source $VIMRUNTIME/mswin.vim       "WinXP Gvim 兼容命令
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vundle manage vim plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                   " required!

"此处规定Vundle的路径
"set rtp+=~/.vim/bundle/vundle/
set rtp+=$VIM/vimfiles/bundle/vundle/

"此处规定插件的安装路径
"call vundle#rc()
call vundle#rc('$VIM/vimfiles/bundle')

"让vundle管理自己 
Bundle 'gmarik/vundle'


"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable file type detection. Use the default filetype settings.
" Also load indent files, to automatically do language-dependent indenting.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype  on
filetype  plugin on
filetype  indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting and line number on.
" 语法高亮和行号
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax    on            
"au FileType c,php,html,js,css set number
set nu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language and code setting
" 语言与编码设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Courier_New:h12

"内部编码,默认参看 :lan,设置为utf8时候，fileencodings检测才更有效果，但会造成菜单以及控制台乱码
"要下载最新的iconv.dll(http://mirrors.kernel.org/gnu/libiconv/libiconv-1.9.1.bin.woe32.zip)
set encoding=utf-8
let &termencoding=&encoding

"解决菜单乱码
source $VIMRUNTIME\delmenu.vim
source $VIMRUNTIME\menu.vim

"解决控制台乱码
language message zh_CN.UTF-8 
language messages zh_CN.UTF-8 

"防止特殊字符无法显示,只有在 'encoding' 为 "utf-8" 或别的 Unicode 编码时才有效,如: ←
set ambw=double

"这里设置会改变所有打开新旧文件的编码方式，需要时可以手动设置
"set fileencoding=utf-8

"取默认值"ucs-bom,utf-8,default,latin1"
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"cp936(包括gbk等)与latin1无法自动识别，所以要手工指定文件编码。重新以cp936的编码方式加载文件为:edit ++enc=cp936

Bundle 'FencView.vim'
":FencView
let g:fencview_autodetect = 0                      

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The current directory is the directory of the file in the current window.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("autocmd")
    "autocmd BufEnter * :lchdir %:p:h
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
endif " has("autocmd")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Various settings
" 其他设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set nobackup                      " keep no backup file

set noswapfile

set browsedir=current           " which directory to use for the file browser
set autochdir

set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set showmatch

set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set ic                          " no ignorecase

set mouse=a                     " enable the use of the mouse
set clipboard=unnamed           "可以直接通过y,p和系统选择缓冲区进行数据交换

set wrap                        " do  wrap lines
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands

set autoindent                  " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line

set shiftwidth=4
set tabstop=4                  " number of spaces that a <Tab> counts for
set softtabstop=4
set wildmenu                   " command-line completion in an enhanced mode
set expandtab

set foldmethod=indent        "indent; syntax; manul
set fdl=2			         "fd level

"au BufWinLeave * silent mkview
"au BufWinEnter * silent loadview

Bundle 'desertedocean.vim'
Bundle 'Guardian'
Bundle 'github-theme'
"colorscheme desertedocean "配置颜色方案
colorscheme github

set laststatus=2		        "总是显示状态行
"highlight StatusLine guifg=red guibg=White " 状态行颜色 
"set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]
"set statusline=%F%m%r%h%w\ [%Y]\ [%{&fenc!=''?&fenc:&enc}]\[%{(&bomb!=''?'bom':'nobom')}]\ [POS=%l,%v][%p%%]\ %{strftime(\"%Y/%m/%d\-\%H:%M\")}
"set statusline=%F%m%r%h%w\ [%Y]\ [%{&fenc!=''?&fenc:&enc}]\[%{(&bomb!=''?'bom':'nobom')}]\ [POS=%l,%v][%p%%]\ 
set statusline=%F%m%r%h%w\ [%Y]\[%{&fenc!=''?&fenc:&enc}]\[%{(&bomb!=''?'bom':'nobom')}]\ 


"Toggle Menu and Toolbar
"set guioptions-=m
"set guioptions-=T
"set guioptions-=r

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

" 关闭错误信息响铃
set noerrorbells

" 关闭使用可视响铃代替呼叫,重启恢复默认,放到_gvimrc
"set novisualbell
"set vb t_vb=

au GUIENTER * simalt ~x                           "启动后最大化
autocmd! bufwritepost _vimrc source $VIM\_vimrc   "修改配置后不用重新启动


"""""""""""""""""""""""
" 键盘映射 key maping "
"""""""""""""""""""""""
let mapleader = ","

map <leader>ec :FencView<CR>
map <leader>s :w<CR>
imap <leader>s <ESC>:w<CR>
map <leader>q :x<CR>  "相当于 :wq
map <leader>ww <C-W><C-W>
map <leader>wj <C-W>j
map <leader>wk <C-W>k
map <leader>wh <C-W>h
map <leader>wl <C-W>l
map <leader>wo <C-W>o
map <leader>ee :tabnew $VIM\_vimrc<cr>
map <leader>eh :tabnew F:\download\360云盘\etc\LinuxNote.txt<cr>
map <leader>ej :tabnew F:\download\360云盘\etc\JSNote.txt<cr>
map <leader>t a<C-R>=strftime("%c")<CR><Esc>


" online doc search
"函数首字母必须大写 变量要先定义
map  <leader>gg :call Gsearch('gg')<CR>
map  <leader>bd :call Gsearch('bd')<CR>
"map  <leader>ff :silent !chrome localhost/lesson/%<cr>
""与jsbeatify冲突，换成x
map  <leader>x :silent !chrome localhost/lesson/css/%<cr>

function! Gsearch(st)
    "let s:browser = "chrome"
    let s:browser = "\"C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe\""
    let s:wordUnderCursor = expand("<cword>")
    let s:myft=expand("%:e")
    let s:url=""
if a:st=='gg'
    if s:myft == "cpp"||s:myft == "c"||s:myft == "ruby"||s:myft == "php"||s:myft == "python"||s:myft == "html"||s:myft == "js"||s:myft == "css"
        let s:url = "www.google.com.hk/search?q=".s:wordUnderCursor."+".s:myft
    else
        let s:url = "www.google.com.hk/search?q=".s:wordUnderCursor
    endif
else
    if s:myft == "cpp"||s:myft == "c"||s:myft == "ruby"||s:myft == "php"||s:myft == "python"||s:myft == "html"||s:myft == "js"||s:myft == "css"
        let s:url = "www.baidu.com.hk/s?wd=".s:wordUnderCursor."+".s:myft
    else
        let s:url = "www.baidu.com.hk/s?wd=".s:wordUnderCursor
    endif
endif
    let s:cmd = "silent !".s:browser." ".s:url
    execute s:cmd
    redraw!
endfunction

"对搜索的设置
map <leader>fw :call YxSearch_Word()<CR>:copen<CR>
function! YxSearch_Word()
let w = expand("<cword>") " 在当前光标位置抓词
execute "vimgrep " w " **"
endfunction

"搜索文件 :Unite file file_rec tag
Bundle 'unite.vim'
let g:unite_source_file_rec_max_cache_files=2000 
Bundle 'tsukkee/unite-tag'
"map <leader>fu :UniteWithCursorWord file file_rec directory<cr>
"map <leader>fu :Unite file file_rec directory<cr>
"map <leader>f :Unite file<cr>

"""""""""""
" 插件汇总"
"""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"语法着色   自带
"智能缩进 	自带
"代码折叠   自带
"打码注释   The-NERD-Commenter   
"可视书签   showmarks visualmark
"标签列表   ctags taglist 
"自动完成   自带 autocomplpop neocomplcache omnicppcompletion 
"参数提示   echofunc code_complete
"快速编码   snipmate xptemplate zencoding c.vim
"代码美化   自带 jsbeatify
"调试编译

"窗口管理   winmanager nerdtree BufExplorer 
"窗口透明   VimTweak
"快速移动   EasyMotion
"文本工具   vimviki


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"透明设置,复制到gvim所在目录
if has('gui_running') || has ('win32') 
    Bundle 'VimTweak'
    map <leader>tm :call libcallnr("vimtweak.dll", "SetAlpha", 150)<CR>
    map <leader>ntm :call libcallnr("vimtweak.dll", "SetAlpha", 255)<CR>
    map <leader>max  :call libcallnr("vimtweak.dll", "EnableMaximize", 1)<CR>
    map <leader>nma  :call libcallnr("vimtweak.dll", "EnableMaximize", 0)<CR>

    map <leader>top :call libcallnr("vimtweak.dll", "EnableTopMost", 1)<CR>
    map <leader>nto :call libcallnr("vimtweak.dll", "EnableTopMost", 0)<CR>
endif

"快速定位
Bundle 'EasyMotion'
",,w

Bundle 'WinMove'
"<up><down><left><write>
"

"前段插件
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'Markdown'
Bundle 'Markdown-syntax'

"可视标签
Bundle 'vmark.vim--Visual-Bookmarking'
"mm mn mp ma

"代码注释
Bundle 'The-NERD-Commenter'
",cc ,c[blank] ,cm ,cs
map <C-H> ,ci

"代码美化 js html css 
Bundle 'node.js'
Bundle 'jsbeautify'
map <leader>js :call g:Jsbeautify()<cr>
Bundle 'vim-coffee-script'

"css显示颜色
Bundle "lilydjwg/colorizer"
let g:colorizer_startup = 1 "启动时候不启用
""",tc

"快速编码之代码模板
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
"真正的代码模板
Bundle "honza/vim-snippets"
" for<tab>,html<tab>
"let g:acp_behaviorSnipmateLength=1      "autocomplpop+snipmate


"快速编码之zencoding
Bundle 'mattn/emmet-vim'
"展开 ,, 跳转,n ,N 图片 ,i 链接 ,a ,A 删除 ,k 选择 ,d 合并 ,m 注释,/
let g:user_emmet_leader_key = ',' 

"自动补全
Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1 
let g:neoComplCache_disable_auto_complete = 0
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_min_keyword_length = 2

"代码模板,不能更新
"Bundle 'Shougo/neosnippet'


"目录浏览
Bundle 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
nmap wt :NERDTreeToggle<CR>

Bundle 'taglist.vim'
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1               " 只显示一个文件
let Tlist_Sort_Type = "order"  			" 根据名字排序 name order
let Tlist_Exit_OnlyWindow=1		    	" 只剩一个窗口时自动关闭
nmap tl :TlistToggle<CR>


"在php文件中的html缩进正常
Bundle 'php.vim-html-enhanced'

"生成php的tags
"map <F4> <Esc>:!ctags -f ./tags -h ".php.inc" -R --exclude=".svn"  --totals=yes  --tag-relative=yes  --PHP-kinds=+cf  --regex-PHP='/abstract class ([^ ]*)/\1/c/'  --regex-PHP='/interface ([^ ]*)/\1/c/'  --regex-PHP='/(public |static |abstract |protected |private)+function ([^ (]*)/\2/f/'<CR>
map <F4> <Esc>:!ctags -f ./tags -h ".php.inc"  --exclude=".svn"  --totals=yes --tag-relative=yes   --PHP-kinds=+cf -R <CR>
"map <F4> <Esc>:!ctags -R<CR>
"au Filetype php set tags+=D:\\xampp\\htdocs\\tytarpas\\tags
au Filetype php set tags+=D:\\xampp\\htdocs\\jinrong\\tags
"
"配置cscope
if has("cscope")
   set csprg=D:\\Vim\\tools\\cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
      " else add database pointed to by environment
   else
      "cs add D:\xampp\htdocs\dytarpas\cscope.out
      cs add D:\xampp\htdocs\jinrong\cscope.out
   endif
   set csverb
endif
map <F5> <Esc>:cs kill -1<CR><Esc>:!start cscope.bat <CR><CR>
"map <F6> <Esc>:cs add D:\xampp\htdocs\tytarpas\cscope.out<CR><CR>
map <F6> <Esc>:cs add D:\xampp\htdocs\jinrong\cscope.out<CR><CR>
"map <leader>fc :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map <leader>fs :cs find 0 <C-R>=expand("<cword>")<CR><CR>


"******************
" PHP 设置        *
"******************
"高亮字符串里的SQL
let php_sql_query=1
"高亮字符串里的HTML
let php_htmlInStrings=1
"禁用php的短标记
let php_noShortTags=1
"启用代码折叠（用于类和函数、自动）
let php_folding=0

""""""""""""""""""
"python
""""""""""""""""""
Bundle 'rkulla/pydiction'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自带全能补全 new-ommi-completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 全能补全      <c,x> <c,o> ;   字典补全 <c,x> <c,k> ;
" 局部关键字补全<c,x> <c,n> ;   标签补全 <c,x> <c,]> ; 
set completeopt=longest,menu

au FileType php setlocal dict+=$VIM/dict/php.dict
au FileType javascript setlocal dict+=$VIM/dict/javascript.dict
"au FileType css set omnifunc=csscomplete#CompleteCSS
"au FileType html set omnifunc=htmlcomplete#CompleteTags

au FileType php set runtimepath+=$VIM/dict/phpmanual/ "添加手册路径
au FileType php set keywordprg=:help            "修改K对应的程序,win不用改,linux默认为!man

"在php文件中可以使用html的代码片段
"au BufRead,BufNewFile *.php set ft=php.html
au BufNewFile,BufRead *.js set ft=javascript.jquery
au BufNewFile,BufRead *.js set syntax=jquery
au BufEnter *.txt set ft=txt 
au Filetype txt set noexpandtab

"au FileType html set syntax=html.js.jquery

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 生成标签 ctags (*****) http://easwy.com/blog/archives/exuberant-ctags-chinese-manual/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<c-]> <c-t>
"au Filetype c set tags+=/home/peakzhao/.vim/systags 

"linux c language develop tags setting
"map <F7> <Esc>:!ctags -R -I __THROW -I  __nonnull --c-kinds=+xp --fields=+lS -f ~/.vim/systags /usr/include /usr/include<CR>
"map <F4> <Esc>:!ctags -R --c-kinds=+lxp --fields=+lS<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"窗口管理 winmanager (*****)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = 'FileExplorer,TagList|BufExplorer'
"let g:winManagerWindowLayout = 'FileExplorer,BufExplorer|TagList'
"let g:winManagerWindowLayout = 'FileExplorer|TagList,BufExplorer'
"let g:persistentBehaviour=0
"nmap wm :WMToggle<CR>

"******************
" AutoComplete    *
" 自动完成        *"
"******************


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动完成 autocomplpop(*****) 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"(注意：html/css非常好，c,php,js的全能补全暂时不支持,需要增加dict)
"设定字典文件

"******************
" Linux + C 设置  *
"******************

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C语言IDE c.vim (*****)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:C_MapLeader = '...'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c snippet和参数提示 code-complete (*****) 依赖tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:completekey = "..."

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在命令行显示函数参数 echofunc.vim (*****)  依赖tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ommicppcompletion 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c++ 的自动补全


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"assistant : Show the prototype of function(PHP/JS/Vim/...) 
"ref.vim 不能用
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"phpDocument
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <C-P> :call PhpDocSingle()<CR>
"vnoremap <C-P> :call PhpDocRange()<CR> 


"surround.vim
"帮助: :h surround
"用法: 改变 cs 增加 ys 删除 ds
"

"mru.vim
"用法：:MRU

let @m = '0f	l"byw'  
let @n = 'yyp/.htmlh'
function! MyExJd()
    let i=0
    exe "normal ".@a
    for i in range(1,str2nr(@b)-1)
        exe "normal ".@c
    endfor
endfunction
":g/.html/call MyExJd()


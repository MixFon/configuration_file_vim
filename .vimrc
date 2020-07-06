"" Last update: 06.07.2020 08:01

set number
set	incsearch
set hlsearch
set nocompatible
set mouse=a						"Включает поддержку мыши при работе в терминале
set mousemodel=popup
colorscheme pablo				"Настройка цветовой схемы
set mousehide
set showmatch
set showcmd						"Показывать незавершенные команды в статус баре автозаполнение ввода.
set t_Co=256
set tabstop=4					"Таб равен 4 пробелам
set shiftwidth=4				"Отступ от левого края
set smarttab					"При нажатии enter на новой строке появляется tab
set softtabstop=4				"Табы в середине строки
set smartindent
syntax on
"set foldenable					"Включть фолдинг (сворачивание блоков)
"set backup						"Вклчить сохранение резервных копий.
set title						"Показать имя буфера в заголовке терминала
set backspace=indent,eol,start  "Отбрасывает отступы в конце строки
set visualbell                  "Вмето бипера мигание экрана.
set laststatus=2
set pastetoggle=

autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt=menu
inoremap <C-space> <C-x><C-o>

" Переключение мужду вкладками с помощью
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

"НАСТРОЙКИ РАБОТЫ С ФАЙЛАМИ--->
"Кодировка редактора (терминала) по умолчанию (при создании все файлы приводятся к этой кодировке)
if has('win32')
   set encoding=cp1251
else
   set encoding=utf-8
   set termencoding=utf-8
endif
" формат файла по умолчанию (влияет на окончания строк) - будет перебираться в указанном порядке
set fileformat=unix
" варианты кодировки файла по умолчанию (все файлы по умолчанию сохраняются в этой кодировке)
set fencs=utf-8,cp1251,koi8-r,cp866
"" Перед сохранением .vimrc обновлять дату последнего изменения
autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))
syntax on " включить подсветку синтаксиса
"" Применять типы файлов
filetype on
filetype plugin on
filetype indent on
autocmd FileType perl call SetPerlConf()

"Путь для поиска файлов командами gf, [f, ]f, ^Wf, :find, :sfind, :tabfind и т.д.
"поиск начинается от директории текущего открытого файла, ищет в ней же
"и в поддиректориях. Пути для поиска перечисляются через запятую, например:
"set path=.,,**,/src,/usr/local
set path=.,,**
"НАСТРОЙКИ РАБОТЫ С ФАЙЛАМИ---<


"" Переключение кодировок файла
   " Меню Encoding -->
        " Выбор кодировки, в которой читать файл -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
            menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
            menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
            menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
            map <F8> :emenu Encoding.Read.<TAB>
        " Выбор кодировки, в которой читать файл <--

        " Выбор кодировки, в которой сохранять файл -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.Write.utf-8<Tab><F7> :set fenc=utf8 <CR>
            menu Encoding.Write.windows-1251<Tab><F7> :set fenc=cp1251<CR>
            menu Encoding.Write.koi8-r<Tab><F7> :set fenc=koi8-r<CR>
            menu Encoding.Write.cp866<Tab><F7> :set fenc=cp866<CR>
            map <F7> :emenu Encoding.Write.<TAB>
        " Выбор кодировки, в которой сохранять файл <--

        " Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.End_line_format.unix<Tab><F6> :set fileformat=unix<CR>
            menu Encoding.End_line_format.dos<Tab><F6> :set fileformat=dos<CR>
            menu Encoding.End_line_format.mac<Tab><F6> :set fileformat=mac<CR>
            map <F6> :emenu Encoding.End_line_format.<TAB>
        " Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
    " Меню Encoding <--

" -------> Подключение Pathogen для подсветки ошибок
" Pathogen необходим для коректной работы плагина Syntastic
" https://vimawesome.com/plugin/syntastic#installation
execute pathogen#infect() 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" <------- Подключение Pathogen для подсветки ошибок

"-------> Настройки для подсветки ошибок C/C++
"Эти настройки можно найти тут:
"https://www.trickrig.net/vim_as_ide
" === sytastic plugin ===
let g:syntastic_cpp_compiler="gcc"
"let g:syntastic_cpp_compiler_exec="F:/mingw/bin/i686-w64-mingw32-g++.exe"
" ключи статического анализатора для настоящих ниндзя - часть можно убрать:
let g:syntastic_cpp_compiler_options="-std=c++17 -Werror -Wall -Wextra -Wpedantic -Weffc++ -Woverloaded-virtual -Wctor-dtor-privacy -Wnon-virtual-dtor -Wold-style-cast -Wconversion -Wsign-conversion -Winit-self -Wunreachable-code"
"<------- Настройки для подсветки ошибок C/C++

" -------> Настройки для проверок ошибок Python
let g:syntastic_python_checkers = ['flake8']
" <------- Настройки для проверок ошибок Python
" Необходимо для vundle
set nocompatible
filetype off

" Установим путь vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Запускаем сам vundle
call vundle#begin()

" Разрешим vundle управлять своей установкой
Plugin 'VundleVim/Vundle.vim'

" Основные плагины
Plugin 'gmarik/vundle.vim'                  " Разрешить vundle управлять собой
Plugin 'flazz/vim-colorschemes'             " Различные темы
Plugin 'hdima/python-syntax'				" Работа с Python
Plugin 'davidhalter/jedi-vim'               " Работа с Python
Plugin 'sheerun/vim-polyglot'				" Синтакс
Plugin 'octol/vim-cpp-enhanced-highlight'	" C++11/17
Plugin 'scrooloose/syntastic'				" Плагин Syntastic для вывода ошибок
"Plugin 'vim-scripts/mru'                    " Most recent use
"Plugin 'jlanzarotta/bufexplorer'            " Работа с буферами
"Plugin 'sjl/gundo.vim'                      " История редактирования на стероидах
"Plugin 'xolox/vim-session'                  " Сессии vim на стероидах
"Plugin 'xolox/vim-misc'                     " Нужен для vim-session
"Plugin 'junegunn/fzf'                       " Отличный поисковик написанный на Go
"Plugin 'aperezdc/vim-template'              " Шаблоны для различных типов файлов
"Plugin 'matze/vim-move'                     " Перемещение строк вниз/вверх

" Languafe C
"Bundle 'LucHermitte/lh-vim-lib'
"Bundle 'LucHermitte/VimFold4C'
"Plugin 'luchermitte/vimfold4c'
"Plugin 'luchermitte/lh-cpp'
"Plugin 'LucHermitte/lh-vim-lib'
"Plugin 'LucHermitte/lh-style'
"Plugin 'LucHermitte/lh-tags'
"Plugin 'LucHermitte/lh-dev'
"Plugin 'LucHermitte/lh-brackets'
"Plugin 'LucHermitte/searchInRuntime'
"Plugin 'LucHermitte/mu-template'
"Plugin 'tomtom/stakeholders_vim'
"Plugin 'LucHermitte/alternate-lite'
"Plugin 'LucHermitte/lh-cpp'

" Навигация по коду
"Plugin 'scrooloose/nerdtree'                " навигация по файловой системе
"Plugin 'majutsushi/tagbar'                  " навигация по классам/функциям/переменным
"Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
"Plugin 'severin-lemaignan/vim-minimap'      " Миникарта как в Sublime Text
"Plugin 'terryma/vim-multiple-cursors'       " Мультикурсор

" Прочее
"Plugin 'bling/vim-airline'                  " строка статуса/состояния
"Plugin 'vim-airline/vim-airline-themes'     " темы для строки статуса состояния
"Plugin 'Lokaltog/powerline'                 " поддержка шрифта powerline
"Plugin 'fisadev/FixedTaskList.vim'          " поиск в файле FIXME, TODO и т.п.
"Plugin 'rosenfeld/conque-term'              " консоли как буферы
"Plugin 'tpope/vim-surround'                 " автозакрытие тегов HML/XML/и т.п.
"Plugin 'jamessan/vim-gnupg'                 " GnuPG support
"Plugin 'mattn/emmet-vim'                    " Emmet for vim
"Plugin 'docunext/closetag.vim'              " Close open HTML tag

" Поддержка сниппетов
"Plugin 'garbas/vim-snipmate'                " Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
"Plugin 'tomtom/tlib_vim'                    " dependencies #2
"Plugin 'honza/vim-snippets'                 " snippets repo

" Поддержка языка
"Plugin 'tpope/vim-commentary'               " Comment stuff out
"Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
"Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
"Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin

" Python
"Plugin 'klen/python-mode'                   " Поддержка python
"Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'                " Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'      " Combined Python 2/3 for Vim
"Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim

" JavaScript
"Plugin 'jelera/vim-javascript-syntax'       " Javascript синтаксис
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'pangloss/vim-javascript'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'Raimondi/delimitMate'
"Plugin 'ternjs/tern_for_vim'                " Позволяет переходить на определение и др
"Plugin 'othree/jspc.vim'
"Plugin 'ramitos/jsctags'

" Базы данных
"Plugin 'krisajenkins/dbext.vim'
"Plugin 'vim-scripts/SQLComplete.vim'
"Plugin 'vim-scripts/SQLUtilities'
"Plugin 'NagatoPain/AutoSQLUpperCase.vim'

call vundle#end()

"filetype plugin indent on

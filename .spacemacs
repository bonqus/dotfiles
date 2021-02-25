;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     haskell
     yaml
     asm
     bibtex
     colors
     cscope
     csv
     dap
     django
     emacs-lisp
     ;; erc
     ;; evil-cleverparens
     git
     helm
     html
     imenu-list ;; Outline
     java
     slack
     (javascript :variables
                 javascript-backend 'tide
                 javascript-fmt-tool 'prettier
                 node-add-modules-path t)
     lua
     (lsp :variables
          lsp-ui-flycheck-enable nil)
     markdown
     multiple-cursors
     org
     ;; (org :variables
     ;;     org-enable-github-support t
     ;;     org-enable-reveal-js-support t)
     (python :variables
             python-indent-offset 4
             python-tab-width 4
             python-formatter 'yapf
             python-enable-yapf-format-on-save nil
             python-sort-imports-on-save t
             python-pipenv-activate t
             python-backend 'lsp
             python-fill-column 99)
     (semantic :disabled-for
               emacs-lisp)
     shell-scripts
     syntax-checking
     systemd
     react
     (typescript :variables
                 typescript-backend 'lsp
                 typescript-lsp-linter nil
                 typescript-linter 'eslint)
     ;; themes-megapack
     version-control
     vimscript
     (node :variable node-add-modules-path)
     (latex :variables
            latex-enable-auto-fill nil ;; Don't auto break lines
            latex-backend 'lsp
            latex-refresh-preview t
            latex-enable-folding t
            ;; latex-enable-magic t
            )
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (auto-completion  :variables
                       auto-completion-return-key-behavior 'complete
                       auto-completion-tab-key-behavior nil
                       auto-completion-enable-snippets-in-popup t
                       auto-completion-enable-sort-by-usage t
                       auto-completion-enable-help-tooltip t
                       auto-completion-complete-with-key-sequence-delay nil
                       auto-completion-private-snippets-directory nil)


     (c-c++ :variables
            c-c++-enable-google-style t
            c-c++-enable-auto-newline t
            c-c++-enable-google-newline t
            c-c++-lsp-enable-semantic-highlight 'rainbow
            c-c++-lsp-semantic-highlight-method 'overlay
            c-c++-enable-clang-support t)

     (spell-checking :variables
                     spell-checking-enable-auto-dictionary t
                     enable-flyspell-auto-completion nil
                     spell-checking-enable-by-default nil)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     yasnippet-snippets
     py-autopep8
     ;; evil-vimish-fold
     openwith
     sphinx-doc
     nord-theme
     rjsx-mode
     all-the-icons
     latex-extra
     company-tabnine
     ts-comint
     prettier-js
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
     company-tern
    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 2048 2048)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 5)
                                (bookmarks . 5)
                                (todos . 5)
                                (agenda . 5)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(nord
                         spacemacs-dark
                         spacemacs-light 
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("SauceCodePro Nerd Font Mono"
                               :size 15.0
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (setq lexical-binding t)
  (setq spacemacs-evil-cursors '(("normal"       "#E5E9F0" box)
                                 ("insert"       "#E5E9F0" (bar . 2))
                                 ("emacs"        "#8FBCBB" box)
                                 ("hybrid"       "#88C0D0" (bar . 2))
                                 ("replace"      "#81A1C1" (hbar . 2))
                                 ("evilified"    "#5E81AC" box)
                                 ("visual"       "#BF616A" (hbar . 2))
                                 ("motion"       "#D08770" box)
                                 ("lisp"         "#EBCB8B" box)
                                 ("iedit"        "#A3BE8C" box)
                                 ("iedit-insert" "#B48EAD" (bar . 2))))
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Enable propper folding
  ;; (evil-vimish-fold-mode t)
  ;; (evil-define-key 'normal 'global "zf" 'vimish-fold-toggle)

  ;; dont fuck with vim standards
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)


  ;; Fixes undefined functions at startup
  ;; (require 'helm)
  ;; (require 'tramp)

  ;; Manual begin company auto-complete
  (define-key evil-insert-state-map (kbd "C-<SPC>") 'company-manual-begin)

  ;; (define-key flyspell-mode-map (kbd "k") 'flyspell-)
  ;;   (define-key flyspell-mode-map (kbd "j"))

  ;; (add-hook 'flyspell-mode-hook (kbd "C-j") 'popup-next)
  ;; (add-hook 'flyspell-mode-hook (kbd "C-k") 'popup-previous)

  ;; (evil-define-key 'flyspell-mode 'global "C-j" 'popup-next)
  ;; (evil-define-key 'flyspell-mode 'global "C-k" 'popup-previous)

  ;; Fix popup bug where it insert '^K' https://github.com/syl20bnr/spacemacs/issues/2974
  ;; (add-hook
  ;;  'company-completion-started-hook
  ;;  (lambda (&rest ignore)
  ;;    (when evil-mode
  ;;      (when (evil-insert-state-p)
  ;;        (define-key evil-insert-state-map (kbd "C-k") nil)))))

  ;; Delete marked region if any key preessed, fx replace marked text on paste
  (delete-selection-mode t)

  ;; Only delete pairs of paranthesis
  ;; (spacemacs/toggle-evil-cleverparens-on)



  ;; visual up and down instead of line based
  ;; (global-visual-line-mode t)
  ;; (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
  ;; (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)

  ;; Disable cursor movement lock on end of line
  ;; (setq-default evil-cross-lines t)

  ;; Auctex titles fonts
  (setq font-latex-fontify-sectioning 'color)
  (setq font-latex-fontify-sectioning 1.0)
  (setq font-latex-fontify-script nil)
  (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
  ;; (setq reftex-default-bibliography '("home/bonqus/Datalogi/bachelor/geometric-stitching/thesis/references.bib"))



  ;; Emacs BEHAVE!
  ;; Just y/n thank you
  (defalias 'yes-or-no-p 'y-or-n-p)
  ;; Decrease wait time on keystrokes and dont pop up dialogs
  (setq echo-keystrokes 0.1
        use-dialog-box nil)

  ;; Calendar localization
  ;; Week starts on monday
  (setq calendar-week-start-day 1)
  ;; Use european date style, i.e. date/month
  (setq european-calendar-style 'european)

  ;; Date format
  (setq calendar-date-display-form
        '((if dayname
              (concat dayname ", "))
          day " " monthname " " year))

  ;; 24 hour clock format
  (setq calendar-time-display-form
        '(24-hours ":" minutes))

  ;; Less fancy powerline
  ;; (setq powerline-default-separator 'nil)


  ;; JS and JSON
  ;; (setq-default js2-basic-offset 2)
  ;; (setq-default js-indent-level 2)



  ;; Shrink windows
  (global-set-key (kbd "<C-up>") 'shrink-window)
  (global-set-key (kbd "<C-down>") 'enlarge-window)
  (global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
  (global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)


  ;; Reveal JS - is this working?
  ;; I think not
  ;; (setq org-reveal-root "file:///home/bonqus/.npm-global/lib/node_modules/reveal")


  ;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1) ;; keyboard scroll one line at a time


  ;; Scroll when cursor is n-lines from top or bottom
  ;; (setq scroll-margin 6)

  ;; LaTeX use zathura as pdf viewer
  (add-hook 'TeX-mode-hook
            '(lambda ()
               (add-to-list 'TeX-view-program-selection
                            '(output-pdf "Zathura"))))

  ;; Open pdfs external with zathura
  (openwith-mode t)
  (setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))

  ;; Debug lsp
  ;; (setq lsp-log-io t)

  ;; lsp
  ;; (require 'lsp-mode)
  ;; (use-package lsp-ui :commands lsp-ui-mode)
  ;; (use-package company-lsp :commands company-lsp)
  ;; (use-package helm-lsp :commands helm-lsp-workspace-symbol)
  ;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
  ;; ;; optionally if you want to use debugger
  ;; (use-package dap-mode)
  ;; (use-package dap-python)

  ;; Python comments
  (add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t)))

  ;; Python set company to not use my virtenv, in order to get completion in virtenv without installing every dependency for company
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))

  ;; Spell-checking
  (define-key flyspell-mode-map (kbd "C-<SPC>") #'flyspell-correct-at-point)
  ;; (setq flyspell-correct-interface #'flyspell-correct-helm)



  ;; Enable flycheck by default
  (add-hook 'LaTeX-mode-hook #'outline-minor-mode)

  ;; Fix flycheck in typescript, html and javascript blocks in vue-mode.
  ;; (with-eval-after-load 'lsp-mode
  ;;   '(with-eval-after-load  'flycheck
  ;;      (mapc #'lsp-flycheck-add-mode '(typescript-mode js-mode css-mode vue-html-mode))))

  ;; Auto hide compilation buffer after timeout on succes
  (defun bury-compile-buffer-if-successful (buffer string)
    "Bury a compilation buffer if succeeded without warnings "
    (when (and
           (buffer-live-p buffer)
           (string-match "compilation" (buffer-name buffer))
           (string-match "finished" string)
           (not
            (with-current-buffer buffer
              (goto-char (point-min))
              (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
                        (bury-buffer buf)
                        (delete-windows-on buf))
                      buffer)))
  (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(package-selected-packages
   '(undo-tree tern powerline spinner ox-gfm tablist org-category-capture magit-popup skewer-mode simple-httpd json-snatcher json-reformat dash-functional parent-mode projectile xcscope bibtex-completion haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct pkg-info epl flx vimish-fold highlight git-commit with-editor iedit anzu autothemer web-completion-data pos-tip eclim bind-map bind-key biblio-core yasnippet packed auctex anaconda-mode pythonic f s avy async auto-complete popup sql-indent company multiple-cursors hydra lv intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode zenburn-theme xterm-color which-key solarized-theme ox-reveal org-ref ivy org-mime org-bullets monokai-theme inkpot-theme hl-todo helm-swoop helm-projectile helm-make helm-company helm-bibtex git-timemachine git-link evil-nerd-commenter evil-matchit dumb-jump color-theme-sanityinc-tomorrow color-identifiers-mode smartparens evil flycheck request helm helm-core markdown-mode alert org-plus-contrib magit transient php-mode js2-mode dash zen-and-art-theme yasnippet-snippets yapfify yaml-mode xkcd x86-lookup ws-butler winum white-sand-theme web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit systemd sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor sphinx-doc spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort py-autopep8 purple-haze-theme pug-mode professional-theme popwin pony-mode planet-theme pip-requirements phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pdf-tools pcre2el parsebib paradox orgit organic-green-theme org-projectile org-present org-pomodoro org-download openwith open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree nasm-mode naquadah-theme mustang-theme multi-term move-text monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum log4e livid-mode live-py-mode linum-relative link-hint light-soap-theme key-chord json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang indent-guide imenu-list hy-mode hungry-delete htmlize highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-pydoc helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-cscope helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme goto-chg gotham-theme google-translate golden-ratio gnuplot gntp gitconfig-mode gitattributes-mode git-messenger git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme fish-mode fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-vimish-fold evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-social-graph erc-image erc-hl-nicks emmet-mode elisp-slime-nav drupal-mode dracula-theme django-theme disaster diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csv-mode company-web company-tern company-statistics company-shell company-quickhelp company-emacs-eclim company-c-headers company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme biblio badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

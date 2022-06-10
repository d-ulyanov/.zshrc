#  ---------------------------------------------------------------------------
#
#  Sections:
#  1.  Env Configs
#  2.  Useful shortcuts
#  3.  File Management
#  4.  Network
#  5.  Git
#  6.  Kubernetes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
    export PS1='%d %1 $ '

#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin/"
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias which='type -all'                     # which:        Find executables
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   ---------------------------
#   4. NETWORK
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address

#   ---------------------------
#   5. GIT
#   ---------------------------

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global core.excludesFile '~/.gitignore'

#   ---------------------------
#   6. Kubernetes
#   ---------------------------

source ~/.kubectl_aliases
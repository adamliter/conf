;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Adam Liter"
      user-mail-address "io@adamliter.org"
      adamliter/my-gpg-key "375B63141683A4D4669E121798723A2089026CD6")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font
      (font-spec :family "Monaspace Neon NF" :size 12 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/"
      org-roam-directory org-directory
      org-roam-db-location (concat org-directory ".org-roam.db"))

(setq citar-bibliography (list (concat org-directory "references/main.bib"))
      citar-library-paths (list (concat org-directory "references/pdfs/"))
      citar-org-roam-subdir "references/notes/"
      citar-notes-paths (list (concat org-directory citar-org-roam-subdir)))

(after! org
  (setq org-startup-folded 'show3levels
        org-ellipsis " [...] "))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq +latex-viewers '(pdf-tools skim evince sumatrapdf zathura okular))
(setq projectile-project-search-path '("~/git/"))
(setq auth-sources '("~/.authinfo.gpg"))
(setq doom-scratch-initial-major-mode 'org-mode)

(setq lsp-pyright-multi-root nil)

(setq adamliter/my-gpg-key-sign-git-arg (format "--gpg-sign=%s" adamliter/my-gpg-key)
      transient-values
      `(
        (magit-commit ,adamliter/my-gpg-key-sign-git-arg)
        (magit-fetch "--prune")
        (magit-pull "--rebase" "--autostash")
        (magit-merge ,adamliter/my-gpg-key-sign-git-arg)
        (magit-rebase "--autostash" ,adamliter/my-gpg-key-sign-git-arg)
        (magit-revert "--edit" "--autostash" ,adamliter/my-gpg-key-sign-git-arg)
        (magit-cherry-apply ,adamliter/my-gpg-key-sign-git-arg)))

(after! emojify
  (setq emojify-inhibit-major-modes
        (append emojify-inhibit-major-modes '(rustic-mode vterm-mode magit-mode))))

(after! magit
  (magit-delta-mode +1)
  (magit-todos-mode +1))
(after! magit-delta
  ;; TODO: figure out how to make this resilient to hot reloading config
  (setq magit-delta-delta-args
        `(,@magit-delta-delta-args "--features" "magit-delta")))

(setq
 fancy-splash-image (file-name-concat doom-user-dir "assets/doom-emacs-dark.svg")
 +doom-dashboard-functions '(doom-dashboard-widget-banner))

(map!
 :after casual-dired
 :map dired-mode-map
 :desc "Toggle dired transient menu from casual-dired package."
 "C-'" #'casual-dired-tmenu)

(setq ispell-program-name "aspell")

(after! recentf
  (add-to-list 'recentf-exclude "/private/var/folders/.*pass"))

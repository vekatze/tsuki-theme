;;; tsuki-theme.el --- A set of reflective colors that lights us into satori -*- lexical-binding: t -*-
;; Version: 1.0.0
;; Package-Requires: ((emacs "26.1"))
;; URL: https://github.com/vekatze/tsuki-theme.el
;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Commentary:
;; A color theme for Emacs.
;;; Code:

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(defun tsuki-theme--semiquote (ast)
  (if (and (listp ast) (not (eq (car ast) 'quote)))
      (cons 'list (mapcar #'tsuki-theme--semiquote ast))
    ast))

(defun tsuki-theme--face-spec-modifier (face-spec)
  (let ((face (nth 0 face-spec))
        (spec (nth 1 face-spec)))
    (tsuki-theme--semiquote `(',face ((t ,spec))))))

(defmacro tsuki-theme--define-theme (theme-name palette face-spec-list)
  (declare (indent defun))
  `(let ,(eval palette)
     (deftheme ,theme-name)
     (custom-theme-set-faces
      ',theme-name
      ,@(mapcar #'tsuki-theme--face-spec-modifier face-spec-list))))

(defvar tsuki-theme-palette
  '((black "#222222")
    (gray "#888888")
    (white "#eeeeee")

    (black-tinted "#032536")
    (gray-tinted "#538aa6")

    (red-light "#f43753")
    (blue-light "#a8d8f0")
    (magenta-light "#e4a8f0")
    (orange-light "#f0c0a8")
    (green-light "#b4f0a8")

    (red "#c5152f")
    (blue "#78c8f0")
    (magenta "#dc78f0")
    (orange "#f0a078")
    (green "#8cf078")

    (red-dim "#79313c")
    (blue-dim "#075175")
    (magenta-dim "#620775")
    (orange-dim "#752b07")
    (green-dim "#1a7507")

    (red-dark "#5E262E")
    (blue-dark "#042f45")
    (magenta-dark "#3a0445")
    (orange-dark "#451a04")
    (green-dark "#0f4504")))

(defun tsuki-theme-get-color (color palette)
  (cadr (assoc color palette)))

(tsuki-theme--define-theme tsuki
  tsuki-theme-palette
  ((ansi-color-black (:foreground black :background black))
   (ansi-color-blue (:foreground blue-dark :background blue-dark))
   (ansi-color-bright-black (:foreground black :background black))
   (ansi-color-bright-blue (:foreground blue-dark :background blue-dark))
   (ansi-color-bright-cyan (:foreground blue-light :background blue-light))
   (ansi-color-bright-green (:foreground green :background green))
   (ansi-color-bright-magenta (:foreground magenta :background magenta))
   (ansi-color-bright-red (:foreground red :background red))
   (ansi-color-bright-white (:foreground white :background white))
   (ansi-color-bright-yellow (:foreground green :background green))
   (ansi-color-cyan (:foreground blue :background blue))
   (ansi-color-fast-blink (:box (:line-width -1)))
   (ansi-color-inverse (:inverse-video t))
   (ansi-color-magenta (:foreground magenta :background magenta))
   (ansi-color-red (:foreground red :background red))
   (ansi-color-slow-blink (:box (:line-width -1)))
   (ansi-color-white (:foreground white :background white))
   (ansi-color-yellow (:foreground green :background green))
   (bookmark-face (:foreground orange))
   (completions-common-part (:foreground blue-light))
   (consult-separator (:foreground black))
   (corfu-bar (:background gray))
   (corfu-border (:background blue))
   (corfu-current (:foreground white :background blue-dim))
   (corfu-default (:background black))
   (cursor (:foreground blue :background blue))
   (custom-button (:foreground magenta-light :background magenta-dim :box (:color magenta :line-width 1)))
   (custom-button-mouse (:inherit 'custom-button))
   (custom-button-pressed (:inherit 'custom-button))
   (custom-changed (:foreground white :background blue-dark))
   (custom-comment (:background gray))
   (custom-comment-tag (:foreground white))
   (custom-invalid (:foreground green :background red-light))
   (custom-modified (:foreground white :background blue-dark))
   (custom-rogue (:foreground orange-light :background black))
   (custom-set (:foreground blue-dark :background white))
   (custom-state (:foreground green))
   (custom-themed (:foreground white :background blue-dark))
   (custom-variable-obsolete (:foreground blue-light))
   (custom-variable-tag (:weight 'bold :foreground blue-light))
   (default (:foreground white :background black))
   (diary (:foreground green))
   (diff-added (:background green-dark))
   (diff-changed (:background magenta-dark))
   (diff-context (:extend t))
   (diff-error (:weight 'bold :foreground red-light :background red-dark))
   (diff-file-header (:inherit font-lock-keyword-face))
   (diff-header (:foreground blue :background blue-dark))
   (diff-hl-change (:background magenta-dark :foreground magenta))
   (diff-hl-delete (:background red-dark :foreground red))
   (diff-hl-insert (:background green-dark :foreground green))
   (diff-hl-reverted-hunk-highlight (:inverse-video t))
   (diff-refine-changed (:background green))
   (diff-removed (:background red-dark))
   (dired-broken-symlink (:weight 'bold :foreground green :background red-light))
   (edebug-disabled-breakpoint (:extend t :background green-dark))
   (embark-verbose-indicator-title (:inherit 'mode-line-active))
   (embark-verbose-indicator-title (:inherit 'mode-line-active))
   (epa-field-body (:slant 'italic :foreground blue-light))
   (epa-field-name (:weight 'bold :foreground blue-light))
   (epa-mark (:weight 'bold :foreground orange))
   (epa-string (:foreground white))
   (epa-validity-disabled (:slant 'italic :inverse-video t))
   (epa-validity-high (:weight 'bold :foreground blue-light))
   (epa-validity-medium (:slant 'italic :foreground blue-light))
   (error (:weight 'bold :foreground orange-light))
   (escape-glyph (:foreground blue-light))
   (eww-form-checkbox (:box (:line-width 2 :style 'released-button) :foreground black :background white))
   (eww-form-file (:box (:line-width 2 :style 'released-button) :foreground black :background gray))
   (eww-form-select (:box (:line-width 2 :style 'released-button) :foreground black :background white))
   (eww-form-submit (:box (:line-width 2 :style 'released-button) :foreground black :background gray))
   (eww-form-text (:box (:line-width 1) :foreground white :background black))
   (eww-form-textarea (:box (:line-width 1) :foreground black :background white))
   (eww-invalid-certificate (:weight 'bold :foreground red-light))
   (eww-valid-certificate (:weight 'bold :foreground green-dim))
   (flycheck-error (:background red-dark :underline (:style 'wave :color red-light)))
   (flycheck-fringe-error (:foreground red :background red-dark))
   (flycheck-fringe-info (:foreground green :background green-dark))
   (flycheck-fringe-warning (:foreground magenta :background magenta-dark))
   (flycheck-info (:background green-dark :underline (:style 'wave :color green-light)))
   (flycheck-posframe-background-face (:inherit 'tooltip))
   (flycheck-posframe-border-face (:foreground blue))
   (flycheck-posframe-face (:foreground blue))
   (flycheck-verify-select-checker (:box (:style 'released-button)))
   (flycheck-warning (:background magenta-dark :underline (:style 'wave :color magenta-light)))
   (flymake-error (:underline (:style 'wave :color red-light)))
   (flymake-note (:underline (:style 'wave :color green)))
   (flymake-warning (:underline (:style 'wave :color blue)))
   (font-lock-builtin-face (:foreground magenta-light :background magenta-dark))
   (font-lock-comment-face (:foreground gray-tinted :background blue-dark))
   (font-lock-constant-face (:foreground magenta-light :background magenta-dark))
   (font-lock-doc-face (:foreground green :background green-dark))
   (font-lock-function-name-face (:foreground magenta-light :background magenta-dark))
   (font-lock-keyword-face (:foreground blue :background blue-dark))
   (font-lock-preprocessor-face (:foreground orange :background orange-dark))
   (font-lock-string-face (:foreground orange :background orange-dark))
   (font-lock-type-face (:foreground green-light :background green-dark))
   (font-lock-variable-name-face (:foreground magenta-light :background magenta-dark))
   (font-lock-warning-face (:foreground red-light :background red-dark))
   (fringe (:foreground gray :background black))
   (git-commit-comment-action (:inherit 'font-lock-comment-face))
   (git-commit-comment-branch-local (:inherit 'font-lock-comment-face))
   (git-commit-comment-branch-remote (:inherit 'font-lock-comment-face))
   (git-commit-comment-detached (:inherit 'font-lock-comment-face))
   (git-commit-comment-file (:inherit 'font-lock-comment-face))
   (git-commit-comment-heading (:inherit 'font-lock-comment-face))
   (git-commit-comment-keyword (:inherit 'font-lock-comment-face))
   (git-commit-known-pseudo-header (:inherit 'git-commit-pseudo-header))
   (git-commit-nonempty-second-line (:inherit 'warning))
   (git-commit-note (:inherit 'default))
   (git-commit-overlong-summary (:inherit 'warning))
   (git-commit-pseudo-header (:inherit 'log-edit-unknown-header))
   (git-commit-summary (:inherit 'log-edit-summary))
   (glyphless-char (:height 0.6))
   (gnus-emphasis-highlight-words (:foreground green :background black))
   (gnus-emphasis-strikethru (:strike-through t))
   (gnus-group-mail-1-empty (:foreground green-light))
   (gnus-group-mail-2-empty (:foreground green-light))
   (gnus-group-mail-3-empty (:foreground green-light))
   (gnus-group-mail-low-empty (:foreground green-light))
   (gnus-group-news-1-empty (:foreground blue-light))
   (gnus-group-news-2-empty (:foreground blue-light))
   (gnus-group-news-low-empty (:foreground blue))
   (gnus-splash (:foreground white))
   (gnus-summary-cancelled (:extend t :foreground green :background black))
   (gnus-summary-normal-ancient (:extend t :foreground blue))
   (gnus-summary-normal-read (:extend t :foreground green))
   (gnus-summary-normal-ticked (:extend t :foreground orange-light))
   (gnus-summary-normal-undownloaded (:weight 'normal :extend t :foreground white))
   (gnus-summary-normal-unread (:extend t))
   (header-line (:inherit 'mode-line))
   (help-for-help-header (:height 1.26))
   (highlight (:background blue-dim))
   (holiday (:background orange-dim))
   (homoglyph (:foreground blue-light))
   (ibuffer-locked-buffer (:foreground orange-light))
   (ido-indicator (:width 'condensed :foreground green :background red-light))
   (ido-only-match (:foreground green-dim))
   (ido-subdir (:foreground red-light))
   (info-menu-star (:foreground red-light))
   (info-node (:weight 'bold :slant 'italic :foreground white))
   (isearch (:background red))
   (isearch-fail (:background orange-dim))
   (isearch-group-1 (:foreground red-dim :background magenta-light))
   (isearch-group-2 (:foreground red-dim :background red-light))
   (lazy-highlight (:background blue-dim))
   (line-number (:foreground gray))
   (line-number-current-line (:weight 'bold))
   (line-number-major-tick (:weight 'bold :background white))
   (line-number-minor-tick (:weight 'bold :background gray))
   (link (:foreground green-light :background green-dark :underline (:style 'line)))
   (link-visited (:inherit 'link))
   (log-view-message (:background magenta-dark :foreground magenta))
   (lsp-installation-buffer-face (:foreground green))
   (lsp-installation-finished-buffer-face (:foreground orange))
   (lsp-ui-doc-background (:background black))
   (lsp-ui-doc-header (:foreground black :background blue))
   (lsp-ui-peek-filename (:foreground orange))
   (lsp-ui-peek-header (:foreground black :background white))
   (lsp-ui-peek-highlight (:box (:line-width -1 :color red-light) :foreground black :background white))
   (lsp-ui-peek-line-number (:foreground black))
   (lsp-ui-peek-list (:background black))
   (lsp-ui-peek-peek (:background black-tinted))
   (lsp-ui-peek-selection (:foreground black :background white))
   (lv-separator (:background black))
   (magit-bisect-bad (:inherit 'error))
   (magit-bisect-good (:inherit 'success))
   (magit-bisect-skip (:inherit 'warning))
   (magit-blame-date (:inherit 'change-log-date))
   (magit-blame-dimmed (:inherit 'shadow))
   (magit-blame-hash (:inherit 'log-view-message))
   (magit-blame-heading (:inherit 'header-line))
   (magit-blame-highlight (:extend t :foreground white :background black))
   (magit-blame-name (:inherit 'change-log-name))
   (magit-blame-summary (:inherit 'magit-blame-heading))
   (magit-branch-current (:inherit 'magit-branch-local :weight 'bold))
   (magit-branch-local (:inherit 'change-log-list))
   (magit-branch-remote (:inherit 'change-log-list))
   (magit-branch-remote-head (:inherit 'magit-branch-remote :weight 'bold))
   (magit-branch-upstream (:inherit 'change-log-list :inverse-video t))
   (magit-cherry-equivalent (:inherit 'success))
   (magit-cherry-unmatched (:inherit 'warning))
   (magit-diff-added (:inherit 'diff-added))
   (magit-diff-added-highlight (:inherit 'magit-diff-added))
   (magit-diff-base (:inherit 'ediff-current-diff-Ancestor))
   (magit-diff-base-highlight (:inherit 'magit-diff-base))
   (magit-diff-context (:inherit 'diff-context))
   (magit-diff-context-highlight (:inherit 'magit-diff-context))
   (magit-diff-file-heading (:inherit 'diff-file-header))
   (magit-diff-file-heading-highlight (:inherit 'magit-diff-file-heading))
   (magit-diff-file-heading-selection (:inherit 'magit-diff-file-heading))
   (magit-diff-hunk-heading (:inherit 'diff-hunk-header))
   (magit-diff-hunk-heading-highlight (:inherit 'magit-diff-hunk-heading))
   (magit-diff-hunk-heading-selection (:inherit 'magit-diff-hunk-heading))
   (magit-diff-hunk-region (:inherit 'default))
   (magit-diff-lines-boundary (:inherit 'default))
   (magit-diff-lines-heading (:inherit 'heading-line))
   (magit-diff-our (:inherit 'ediff-current-diff-A))
   (magit-diff-our-highlight (:inherit 'magit-diff-our))
   (magit-diff-removed (:inherit 'diff-removed))
   (magit-diff-removed-highlight (:inherit 'magit-diff-removed))
   (magit-diff-their (:inherit 'ediff-current-diff-C))
   (magit-diff-their-highlight (:inherit 'magit-diff-their))
   (magit-diff-whitespace-warning (:inherit 'trailing-whitespace))
   (magit-diffstat-added (:inherit 'diff-added))
   (magit-diffstat-removed (:inherit 'magit-diffstat-removed))
   (magit-dimmed (:inherit 'shadow))
   (magit-filename (:inherit 'change-log-file))
   (magit-hash (:inherit 'log-view-message))
   (magit-head (:inherit 'change-log-list :inverse-video t))
   (magit-header-line (:foreground blue-light :background blue-dim :box (:color blue :line-width 1)))
   (magit-keyword (:inherit 'default))
   (magit-log-author (:inherit 'change-log-name))
   (magit-log-date (:inherit 'change-log-date))
   (magit-log-graph (:inherit 'default))
   (magit-mode-line-process (:inherit 'mode-line-emphasis))
   (magit-mode-line-process-error (:inherit 'error))
   (magit-process-ng (:inherit 'error))
   (magit-process-ok (:inherit 'success))
   (magit-reflog-amend (:inherit 'log-view-message))
   (magit-reflog-checkout (:inherit 'log-view-message))
   (magit-reflog-cherry-pick (:inherit 'log-view-message))
   (magit-reflog-commit (:inherit 'log-view-message))
   (magit-reflog-merge (:inherit 'log-view-message))
   (magit-reflog-other (:inherit 'log-view-message))
   (magit-reflog-rebase (:inherit 'log-view-message))
   (magit-reflog-remote (:inherit 'log-view-message))
   (magit-reflog-reset (:inherit 'log-view-message))
   (magit-refname (:inherit 'change-log-list))
   (magit-refname-stash (:inherit 'magit-refname))
   (magit-refname-wip (:inherit 'magit-refname))
   (magit-section-heading (:inherit 'font-lock-type-face))
   (magit-section-heading-secondary-heading (:inherit 'magit-section-heading-selection))
   (magit-section-heading-selection (:weight 'bold))
   (magit-section-highlight ())
   (magit-sequence-done (:inherit 'success))
   (magit-sequence-drop (:inherit 'error))
   (magit-sequence-head (:inherit 'default :weight 'bold))
   (magit-sequence-onto (:inherit 'success :weight 'bold))
   (magit-sequence-part (:inherit 'default))
   (magit-sequence-pick (:inherit 'warning))
   (magit-sequence-stop (:inherit 'default :weight 'bold))
   (magit-signature-bad (:inherit 'error))
   (magit-signature-error (:inherit 'error :weight 'bold))
   (magit-signature-expired (:inherit 'warning))
   (magit-signature-expired-key (:inherit 'warning))
   (magit-signature-good (:inherit 'success))
   (magit-signature-revoked (:inherit 'warning))
   (magit-signature-untrusted (:inherit 'warning :weight 'bold))
   (magit-tag (:inherit 'change-log-list))
   (markdown-highlighting-face (:foreground black :background green))
   (match (:inherit 'highlight))
   (mc/cursor-bar-face (:height 1 :background blue))
   (mc/cursor-face (:inverse-video t))
   (menu (:inverse-video t))
   (message-cited-text-1 (:foreground orange-light))
   (message-cited-text-2 (:foreground green-dim))
   (message-cited-text-3 (:foreground orange))
   (message-cited-text-4 (:foreground orange))
   (message-header-cc (:weight 'bold :foreground green))
   (message-header-name (:foreground green))
   (message-header-newsgroups (:weight 'bold :slant 'italic :foreground green))
   (message-header-other (:foreground red-light))
   (message-header-subject (:foreground green))
   (message-header-to (:weight 'bold :foreground green))
   (message-header-xheader (:foreground blue))
   (message-mml (:foreground green))
   (message-separator (:foreground blue-light))
   (mini-popup-border (:inherit 'window-divider))
   (minibuffer-prompt (:inherit font-lock-function-name-face))
   (mm-command-output (:foreground green-dim))
   (mm-uu-extract (:extend t :foreground white :background green-dim))
   (mode-line (:foreground blue :background blue-dim :box (:color blue :line-width 1)))
   (mode-line-active (:inherit 'mode-line))
   (mode-line-highlight (:background blue))
   (mode-line-inactive (:foreground blue :background blue-dark :box (:color blue :line-width 1)))
   (nobreak-hyphen (:foreground blue-light))
   (ns-marked-text-face (:underline white))
   (ns-unmarked-text-face (:underline black))
   (ns-working-text-face (:underline white))
   (orderless-match-face-0 (:weight 'bold :foreground blue))
   (orderless-match-face-1 (:weight 'bold :foreground magenta-light))
   (orderless-match-face-2 (:weight 'bold :foreground green))
   (orderless-match-face-3 (:weight 'bold :foreground orange-light))
   (org-agenda-dimmed-todo-face (:foreground gray))
   (org-agenda-done (:foreground green))
   (org-agenda-restriction-lock (:background black))
   (org-agenda-structure (:foreground blue))
   (org-block (:background black-tinted :extend t))
   (org-block-begin-line (:foreground blue :background blue-dark :extend t))
   (org-block-end-line (:foreground blue :background blue-dark :extend t))
   (org-clock-overlay (:foreground white :background gray-tinted))
   (org-column (:weight 'normal :slant 'normal :underline nil :strike-through nil :background black))
   (org-column-title (:weight 'bold :underline t :background black))
   (org-date (:underline t :foreground blue-light))
   (org-date-selected (:inverse-video t :foreground orange-light))
   (org-dispatcher-highlight (:weight 'bold :foreground orange-light :background black))
   (org-document-info (:foreground blue-light))
   (org-document-title (:weight 'bold :foreground blue-light))
   (org-done (:weight 'bold :foreground green))
   (org-drawer (:foreground blue))
   (org-ellipsis (:underline t :foreground green-light))
   (org-footnote (:underline t :foreground blue-light))
   (org-formula (:foreground orange))
   (org-headline-done (:foreground orange))
   (org-headline-todo (:foreground magenta-light))
   (org-hide (:foreground black))
   (org-latex-and-related (:foreground orange-light))
   (org-scheduled (:foreground green))
   (org-scheduled-previously (:foreground orange))
   (org-scheduled-today (:foreground green))
   (org-sexp-date (:foreground blue-light))
   (org-table (:foreground blue))
   (org-time-grid (:foreground green-light))
   (org-todo (:weight 'bold :foreground orange-light))
   (org-upcoming-deadline (:foreground orange))
   (outline-1 (:inherit font-lock-keyword-face))
   (outline-2 (:inherit font-lock-type-face))
   (outline-3 (:inherit font-lock-variable-name-face))
   (outline-4 (:inherit font-lock-doc-face))
   (outline-5 (:inherit font-lock-keyword-face))
   (outline-6 (:inherit font-lock-type-face))
   (outline-7 (:inherit font-lock-variable-name-face))
   (outline-8 (:inherit font-lock-doc-face))
   (pulse-highlight-face (:extend nil :background green))
   (pulse-highlight-start-face (:background green))
   (region (:background blue-dim :extend t))
   (ruri-flycheck-error (:foreground red-light :background red-dark))
   (ruri-flycheck-info (:foreground green :background green-dark))
   (ruri-flycheck-warning (:foreground orange :background orange-dark))
   (ruri-summary-body (:background blue-dark :weight 'bold))
   (ruri-summary-secondary (:foreground white :background blue-dark))
   (secondary-selection (:inherit 'highlight))
   (separator-line (:height 0.1 :background black))
   (shadow (:foreground gray))
   (show-paren-match (:foreground green :background green-dark :underline t))
   (show-paren-mismatch (:foreground red :background red-dark :underline t))
   (shr-mark (:foreground black :background green))
   (shr-strike-through (:strike-through t))
   (shr-sup (:height 0.8))
   (smerge-base (:extend t :background green-dim))
   (smerge-lower (:extend t :background green-dark))
   (smerge-markers (:extend t :background black))
   (smerge-upper (:extend t :background red-dark))
   (straight-process-command (:inherit font-lock-function-name-face))
   (straight-process-error (:inherit 'diff-error))
   (success (:foreground green :background green-dark))
   (tabulated-list-fake-header (:weight 'bold :underline t :overline t))
   (tool-bar (:box (:line-width 1 :style 'released-button) :foreground black :background white))
   (tooltip (:foreground white :background blue-dark :box (:color blue :line-width 1)))
   (trailing-whitespace (:background red-light))
   (transient-disabled-suffix (:weight 'bold :foreground black :background red-light))
   (transient-enabled-suffix (:weight 'bold :foreground black :background green))
   (transient-separator (:extend t :background black))
   (treemacs-all-the-icons-file-face (:inherit 'font-lock-keyword-face))
   (treemacs-all-the-icons-root-face (:inherit 'font-lock-keyword-face))
   (tty-menu-disabled-face (:foreground white :background blue-dim))
   (tty-menu-enabled-face (:weight 'bold :foreground green :background blue-dim))
   (tty-menu-selected-face (:background red-light))
   (vertical-border (:foreground blue))
   (vundo-default (:foreground gray))
   (vundo-highlight (:foreground green-light :background green-dark :inherit 'vundo-default))
   (warning (:foreground orange :background orange-dark))
   (which-func (:foreground blue-dark))
   (whitespace-big-indent (:foreground red :background red-light))
   (whitespace-empty (:extend t :foreground red :background green))
   (whitespace-hspace (:foreground gray :background black))
   (whitespace-indentation (:foreground red :background green))
   (whitespace-line (:foreground magenta :background black))
   (whitespace-missing-newline-at-eof (:foreground black :background green))
   (whitespace-newline (:weight 'normal :foreground gray))
   (whitespace-space (:foreground gray :background black))
   (whitespace-space-after-tab (:foreground red :background green))
   (whitespace-space-before-tab (:foreground red :background orange))
   (whitespace-tab (:foreground gray :background black))
   (whitespace-trailing (:foreground red :background red-dark))
   (widget-button-pressed (:foreground red-light))
   (widget-documentation (:foreground green))
   (widget-field (:extend t :box (:line-width 1 :color gray) :background gray))
   (widget-single-line-field (:background gray))
   (window-divider (:foreground blue))
   (window-divider-first-pixel (:foreground blue))
   (window-divider-last-pixel (:foreground blue))))

(provide-theme 'tsuki)

;;; tsuki-theme.el ends here

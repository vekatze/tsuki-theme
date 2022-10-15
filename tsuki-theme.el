;;; tsuki-theme.el --- A set of reflective colors that lights us into satori -*- lexical-binding: t -*-
;; Author: vekatze <vekatze@icloud.com>
;; Package-Requires: ((emacs "26.1"))
;; SPDX-License-Identifier: GPL-3.0-or-later
;; URL: https://github.com/vekatze/tsuki-theme.el
;; Version: 1.0.0
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
  "Constructs an \"evaluatable\" version of given AST.

For example, this function transforms (a 'b c) into a (list a 'b c)."
  (if (and (listp ast) (not (eq (car ast) 'quote)))
      (cons 'list (mapcar #'tsuki-theme--semiquote ast))
    ast))

(defun tsuki-theme--face-spec-modifier (face-spec)
  "Modify FACE-SPEC to match with the form required by `custom-theme-set-faces'."
  (let ((face (nth 0 face-spec))
        (spec (nth 1 face-spec)))
    (tsuki-theme--semiquote `(',face ((t ,spec))))))

(defmacro tsuki-theme--define-theme (theme palette face-spec-list)
  "Define a THEME using PALETTE and FACE-SPEC-LIST."
  (declare (indent defun))
  `(let ,(eval palette)
     (deftheme ,theme)
     (custom-theme-set-faces
      ',theme
      ,@(mapcar #'tsuki-theme--face-spec-modifier face-spec-list))))

(defvar tsuki-theme-palette
  '((white "#eeeeee")
    (gray "#888888")
    (black "#222222")

    (tsuki "#075175")

    (nibi "#538aa6")
    (sumi "#032536")
    (kuchiba "#a66f53")

    (light-blue "#a8d8f0")
    (light-magenta "#e4a8f0")
    (light-orange "#f0c0a8")
    (light-green "#b4f0a8")
    (light-red "#f5a4b0")

    (mid-blue "#78c8f0")
    (mid-magenta "#dc78f0")
    (mid-orange "#f0a078")
    (mid-green "#8cf078")
    (mid-red "#f43753")

    (dark-blue "#042f45")
    (dark-magenta "#3a0445")
    (dark-orange "#451a04")
    (dark-green "#0f4504")
    (dark-red "#5E262E")))

(defun tsuki-theme-get-color (color palette)
  "Get certain COLOR from PALETTE."
  (cadr (assoc color palette)))

(tsuki-theme--define-theme tsuki
  tsuki-theme-palette
  ((ansi-color-black (:foreground black :background black))
   (ansi-color-blue (:foreground dark-blue :background dark-blue))
   (ansi-color-bright-black (:foreground black :background black))
   (ansi-color-bright-blue (:foreground dark-blue :background dark-blue))
   (ansi-color-bright-cyan (:foreground light-blue :background light-blue))
   (ansi-color-bright-green (:foreground mid-green :background mid-green))
   (ansi-color-bright-magenta (:foreground mid-magenta :background mid-magenta))
   (ansi-color-bright-red (:foreground mid-red :background mid-red))
   (ansi-color-bright-white (:foreground white :background white))
   (ansi-color-bright-yellow (:foreground mid-green :background mid-green))
   (ansi-color-cyan (:foreground mid-blue :background mid-blue))
   (ansi-color-fast-blink (:box (:line-width -1)))
   (ansi-color-inverse (:inverse-video t))
   (ansi-color-magenta (:foreground mid-magenta :background mid-magenta))
   (ansi-color-red (:foreground mid-red :background mid-red))
   (ansi-color-slow-blink (:box (:line-width -1)))
   (ansi-color-white (:foreground white :background white))
   (ansi-color-yellow (:foreground mid-green :background mid-green))
   (bookmark-face (:foreground mid-orange))
   (completions-common-part (:foreground light-blue))
   (consult-separator (:foreground black))
   (corfu-bar (:background gray))
   (corfu-border (:background mid-blue))
   (corfu-current (:foreground white :background tsuki))
   (corfu-default (:background black))
   (cursor (:foreground mid-blue :background mid-blue))
   (custom-button (:foreground light-magenta :background dark-magenta :box (:color mid-magenta :line-width 1)))
   (custom-button-mouse (:inherit 'custom-button))
   (custom-button-pressed (:inherit 'custom-button))
   (custom-changed (:foreground white :background dark-blue))
   (custom-comment (:background gray))
   (custom-comment-tag (:foreground white))
   (custom-invalid (:inherit 'error))
   (custom-modified (:foreground white :background dark-blue))
   (custom-rogue (:foreground light-orange :background black))
   (custom-set (:foreground dark-blue :background white))
   (custom-state (:foreground mid-green))
   (custom-themed (:foreground white :background dark-blue))
   (custom-variable-obsolete (:foreground light-blue))
   (custom-variable-tag (:weight 'bold :foreground light-blue))
   (default (:foreground white :background black))
   (diary (:foreground mid-green))
   (diff-added (:foreground light-green :background dark-green))
   (diff-changed (:foreground light-magenta :background dark-magenta))
   (diff-context (:foreground gray :extend t))
   (diff-error (:weight 'bold :inherit 'error))
   (diff-file-header (:inherit font-lock-keyword-face))
   (diff-header (:foreground mid-blue :background dark-blue))
   (diff-hl-change (:inherit 'diff-changed))
   (diff-hl-delete (:inherit 'diff-removed))
   (diff-hl-insert (:inherit 'diff-added))
   (diff-hl-reverted-hunk-highlight (:inverse-video t))
   (diff-refine-changed (:background mid-green))
   (diff-removed (:foreground light-red :background dark-red))
   (dired-broken-symlink (:weight 'bold :inherit 'error))
   (edebug-disabled-breakpoint (:extend t :background dark-green))
   (embark-verbose-indicator-title (:inherit 'mode-line-active))
   (embark-verbose-indicator-title (:inherit 'mode-line-active))
   (epa-field-body (:slant 'italic :foreground light-blue))
   (epa-field-name (:weight 'bold :foreground light-blue))
   (epa-mark (:weight 'bold :foreground mid-orange))
   (epa-string (:foreground white))
   (epa-validity-disabled (:slant 'italic :inverse-video t))
   (epa-validity-high (:weight 'bold :foreground light-blue))
   (epa-validity-medium (:slant 'italic :foreground light-blue))
   (error (:weight 'bold :foreground mid-red :background dark-red))
   (escape-glyph (:foreground light-blue))
   (eww-form-checkbox (:box (:line-width 2 :style 'released-button) :foreground black :background white))
   (eww-form-file (:box (:line-width 2 :style 'released-button) :foreground black :background gray))
   (eww-form-select (:box (:line-width 2 :style 'released-button) :foreground black :background white))
   (eww-form-submit (:box (:line-width 2 :style 'released-button) :foreground black :background gray))
   (eww-form-text (:box (:line-width 1) :foreground white :background black))
   (eww-form-textarea (:box (:line-width 1) :foreground black :background white))
   (eww-invalid-certificate (:weight 'bold :inherit 'error))
   (eww-valid-certificate (:weight 'bold :foreground dark-green))
   (flycheck-error (:background dark-red :underline (:style 'wave :color mid-red)))
   (flycheck-fringe-error (:foreground mid-red :background dark-red))
   (flycheck-fringe-info (:foreground mid-green :background dark-green))
   (flycheck-fringe-warning (:foreground mid-magenta :background dark-magenta))
   (flycheck-info (:background dark-green :underline (:style 'wave :color light-green)))
   (flycheck-posframe-background-face (:inherit 'tooltip))
   (flycheck-posframe-border-face (:foreground mid-blue))
   (flycheck-posframe-face (:foreground mid-blue))
   (flycheck-verify-select-checker (:box (:style 'released-button)))
   (flycheck-warning (:background dark-magenta :underline (:style 'wave :color light-magenta)))
   (flymake-error (:inherit 'flycheck-error))
   (flymake-note (:inherit 'flycheck-info))
   (flymake-warning (:inherit 'flycheck-warning))
   (font-lock-builtin-face (:foreground light-magenta :background dark-magenta))
   (font-lock-comment-face (:foreground nibi :background dark-blue))
   (font-lock-constant-face (:foreground light-magenta :background dark-magenta))
   (font-lock-doc-face (:inherit 'font-lock-comment-face))
   (font-lock-function-name-face (:foreground light-magenta :background dark-magenta))
   (font-lock-keyword-face (:foreground mid-blue :background dark-blue))
   (font-lock-preprocessor-face (:foreground kuchiba :background dark-orange))
   (font-lock-string-face (:foreground mid-orange :background dark-orange))
   (font-lock-type-face (:foreground light-green :background dark-green))
   (font-lock-variable-name-face (:foreground light-magenta :background dark-magenta))
   (font-lock-warning-face (:foreground light-red :background dark-red))
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
   (gnus-emphasis-highlight-words (:foreground mid-green :background black))
   (gnus-emphasis-strikethru (:strike-through t))
   (gnus-group-mail-1-empty (:foreground light-green))
   (gnus-group-mail-2-empty (:foreground light-green))
   (gnus-group-mail-3-empty (:foreground light-green))
   (gnus-group-mail-low-empty (:foreground light-green))
   (gnus-group-news-1-empty (:foreground light-blue))
   (gnus-group-news-2-empty (:foreground light-blue))
   (gnus-group-news-low-empty (:foreground mid-blue))
   (gnus-splash (:foreground white))
   (gnus-summary-cancelled (:extend t :foreground mid-green :background black))
   (gnus-summary-normal-ancient (:extend t :foreground mid-blue))
   (gnus-summary-normal-read (:extend t :foreground mid-green))
   (gnus-summary-normal-ticked (:extend t :foreground light-orange))
   (gnus-summary-normal-undownloaded (:weight 'normal :extend t :foreground white))
   (gnus-summary-normal-unread (:extend t))
   (header-line (:inherit 'mode-line))
   (help-for-help-header (:height 1.26))
   (highlight (:background tsuki))
   (holiday (:background dark-orange))
   (homoglyph (:foreground light-blue))
   (ibuffer-locked-buffer (:foreground light-orange))
   (ido-indicator (:width 'condensed :foreground mid-green :background light-red))
   (ido-only-match (:foreground dark-green))
   (ido-subdir (:foreground light-red))
   (info-menu-star (:foreground light-red))
   (info-node (:weight 'bold :slant 'italic :foreground white))
   (isearch (:foreground mid-red :background dark-red))
   (isearch-fail (:background dark-orange))
   (isearch-group-1 (:foreground dark-red :background light-magenta))
   (isearch-group-2 (:foreground dark-red :background light-red))
   (lazy-highlight (:foreground light-green :background dark-green))
   (line-number (:foreground gray))
   (line-number-current-line (:weight 'bold))
   (line-number-major-tick (:weight 'bold :background white))
   (line-number-minor-tick (:weight 'bold :background gray))
   (link (:foreground light-green :background dark-green :underline (:style 'line)))
   (link-visited (:inherit 'link))
   (log-view-message (:background dark-magenta :foreground mid-magenta))
   (lsp-installation-buffer-face (:foreground mid-green))
   (lsp-installation-finished-buffer-face (:foreground mid-orange))
   (lsp-ui-doc-background (:background black))
   (lsp-ui-doc-header (:foreground black :background mid-blue))
   (lsp-ui-peek-filename (:foreground mid-orange))
   (lsp-ui-peek-header (:foreground black :background white))
   (lsp-ui-peek-highlight (:box (:line-width -1 :color light-red) :foreground black :background white))
   (lsp-ui-peek-line-number (:foreground black))
   (lsp-ui-peek-list (:background black))
   (lsp-ui-peek-peek (:background sumi))
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
   (magit-diff-lines-boundary (:background mid-blue))
   (magit-diff-lines-heading nil)
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
   (magit-header-line (:foreground light-blue :background tsuki :box (:color mid-blue :line-width 1)))
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
   (markdown-highlighting-face (:foreground black :background mid-green))
   (match (:inherit 'highlight))
   (mc/cursor-bar-face (:height 1 :background mid-blue))
   (mc/cursor-face (:inverse-video t))
   (menu (:inverse-video t))
   (message-cited-text-1 (:foreground light-orange))
   (message-cited-text-2 (:foreground dark-green))
   (message-cited-text-3 (:foreground mid-orange))
   (message-cited-text-4 (:foreground mid-orange))
   (message-header-cc (:weight 'bold :foreground mid-green))
   (message-header-name (:foreground mid-green))
   (message-header-newsgroups (:weight 'bold :slant 'italic :foreground mid-green))
   (message-header-other (:foreground light-red))
   (message-header-subject (:foreground mid-green))
   (message-header-to (:weight 'bold :foreground mid-green))
   (message-header-xheader (:foreground mid-blue))
   (message-mml (:foreground mid-green))
   (message-separator (:foreground light-blue))
   (mini-popup-border (:inherit 'window-divider))
   (minibuffer-prompt (:inherit font-lock-function-name-face))
   (mm-command-output (:foreground dark-green))
   (mm-uu-extract (:extend t :foreground white :background dark-green))
   (mode-line (:foreground mid-blue :background tsuki :box (:color mid-blue :line-width 1)))
   (mode-line-active (:inherit 'mode-line))
   (mode-line-highlight (:background mid-blue))
   (mode-line-inactive (:foreground mid-blue :background dark-blue :box (:color mid-blue :line-width 1)))
   (nobreak-hyphen (:foreground light-blue))
   (ns-marked-text-face (:underline white))
   (ns-unmarked-text-face (:underline black))
   (ns-working-text-face (:underline white))
   (orderless-match-face-0 (:weight 'bold :foreground mid-blue))
   (orderless-match-face-1 (:weight 'bold :foreground light-magenta))
   (orderless-match-face-2 (:weight 'bold :foreground mid-green))
   (orderless-match-face-3 (:weight 'bold :foreground light-orange))
   (org-agenda-dimmed-todo-face (:foreground gray))
   (org-agenda-done (:foreground mid-green))
   (org-agenda-restriction-lock (:background black))
   (org-agenda-structure (:foreground mid-blue))
   (org-block (:background sumi :extend t))
   (org-block-begin-line (:foreground mid-blue :background dark-blue :extend t))
   (org-block-end-line (:foreground mid-blue :background dark-blue :extend t))
   (org-clock-overlay (:foreground white :background nibi))
   (org-column (:weight 'normal :slant 'normal :underline nil :strike-through nil :background black))
   (org-column-title (:weight 'bold :underline t :background black))
   (org-date (:underline t :foreground light-blue))
   (org-date-selected (:inverse-video t :foreground light-orange))
   (org-dispatcher-highlight (:weight 'bold :foreground light-orange :background black))
   (org-document-info (:foreground light-blue))
   (org-document-title (:weight 'bold :foreground light-blue))
   (org-done (:weight 'bold :foreground mid-green))
   (org-drawer (:foreground mid-blue))
   (org-ellipsis (:underline t :foreground light-green))
   (org-footnote (:underline t :foreground light-blue))
   (org-formula (:foreground mid-orange))
   (org-headline-done (:foreground mid-orange))
   (org-headline-todo (:foreground light-magenta))
   (org-hide (:foreground black))
   (org-latex-and-related (:foreground light-orange))
   (org-scheduled (:foreground mid-green))
   (org-scheduled-previously (:foreground mid-orange))
   (org-scheduled-today (:foreground mid-green))
   (org-sexp-date (:foreground light-blue))
   (org-table (:foreground mid-blue))
   (org-time-grid (:foreground light-green))
   (org-todo (:weight 'bold :foreground light-orange))
   (org-upcoming-deadline (:foreground mid-orange))
   (outline-1 (:inherit font-lock-keyword-face))
   (outline-2 (:inherit font-lock-type-face))
   (outline-3 (:inherit font-lock-variable-name-face))
   (outline-4 (:inherit font-lock-doc-face))
   (outline-5 (:inherit font-lock-keyword-face))
   (outline-6 (:inherit font-lock-type-face))
   (outline-7 (:inherit font-lock-variable-name-face))
   (outline-8 (:inherit font-lock-doc-face))
   (pulse-highlight-face (:extend nil :background mid-green))
   (pulse-highlight-start-face (:background mid-green))
   (region (:background tsuki :extend t))
   (ruri-flycheck-error (:foreground mid-red :background dark-red))
   (ruri-flycheck-info (:foreground mid-green :background dark-green))
   (ruri-flycheck-warning (:foreground mid-orange :background dark-orange))
   (ruri-summary-body (:background dark-blue :weight 'bold))
   (ruri-summary-secondary (:foreground white :background dark-blue))
   (secondary-selection (:inherit 'highlight))
   (separator-line (:height 0.1 :background black))
   (shadow (:foreground gray))
   (show-paren-match (:foreground mid-green :background dark-green :underline t))
   (show-paren-mismatch (:foreground mid-red :background dark-red :underline t))
   (shr-mark (:foreground black :background mid-green))
   (shr-strike-through (:strike-through t))
   (shr-sup (:height 0.8))
   (smerge-base (:extend t :background dark-green))
   (smerge-lower (:extend t :background dark-green))
   (smerge-markers (:extend t :background black))
   (smerge-upper (:extend t :background dark-red))
   (straight-process-command (:inherit font-lock-function-name-face))
   (straight-process-error (:inherit 'diff-error))
   (success (:foreground mid-green :background dark-green))
   (tabulated-list-fake-header (:weight 'bold :underline t :overline t))
   (tool-bar (:box (:line-width 1 :style 'released-button) :foreground black :background white))
   (tooltip (:foreground white :background dark-blue :box (:color mid-blue :line-width 1)))
   (trailing-whitespace (:background mid-red))
   (transient-disabled-suffix (:weight 'bold :foreground black :background light-red))
   (transient-enabled-suffix (:weight 'bold :foreground black :background mid-green))
   (transient-separator (:extend t :background black))
   (treemacs-all-the-icons-file-face (:inherit 'font-lock-keyword-face))
   (treemacs-all-the-icons-root-face (:inherit 'font-lock-keyword-face))
   (tty-menu-disabled-face (:foreground white :background tsuki))
   (tty-menu-enabled-face (:weight 'bold :foreground mid-green :background tsuki))
   (tty-menu-selected-face (:background light-red))
   (vertical-border (:foreground mid-blue))
   (vundo-default (:foreground gray))
   (vundo-highlight (:foreground light-green :background dark-green :inherit 'vundo-default))
   (warning (:foreground mid-orange :background dark-orange))
   (which-func (:foreground dark-blue))
   (whitespace-big-indent (:foreground mid-red :background light-red))
   (whitespace-empty (:extend t :foreground mid-red :background mid-green))
   (whitespace-hspace (:foreground gray :background black))
   (whitespace-indentation (:foreground mid-red :background mid-green))
   (whitespace-line (:foreground mid-magenta :background black))
   (whitespace-missing-newline-at-eof (:foreground black :background mid-green))
   (whitespace-newline (:weight 'normal :foreground gray))
   (whitespace-space (:foreground gray :background black))
   (whitespace-space-after-tab (:foreground mid-red :background mid-green))
   (whitespace-space-before-tab (:foreground mid-red :background mid-orange))
   (whitespace-tab (:foreground gray :background black))
   (whitespace-trailing (:foreground mid-red :background dark-red))
   (widget-button-pressed (:foreground light-red))
   (widget-documentation (:foreground mid-green))
   (widget-field (:extend t :box (:line-width 1 :color gray) :background gray))
   (widget-single-line-field (:background gray))
   (window-divider (:foreground mid-blue))
   (window-divider-first-pixel (:foreground mid-blue))
   (window-divider-last-pixel (:foreground mid-blue))))

(provide-theme 'tsuki)

;;; tsuki-theme.el ends here

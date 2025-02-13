;;; tsuki-theme.el --- A set of reflective colors that lights us into satori -*- lexical-binding: t -*-
;; Author: vekatze <vekatze@icloud.com>
;; Package-Requires: ((emacs "26.1"))
;; SPDX-License-Identifier: GPL-3.0-or-later
;; URL: https://github.com/vekatze/tsuki-theme.el
;; Version: 1.1.0
;;; Commentary:
;; A color theme for Emacs.
;;; Code:

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(defvar tsuki-theme-palette
  '((white . "#eeeeee")
    (gray . "#888888")
    (black . "#222222")

    (yoru . "#075175")
    (sumi . "#032536")
    (nibi . "#538aa6")
    (kuchiba . "#a66f53")

    (light-black . "#333333")
    (light-blue . "#a8d8f0")
    (light-magenta . "#e4a8f0")
    (light-orange . "#f0c0a8")
    (light-green . "#b4f0a8")
    (light-red . "#f5a4b0")
    (light-yellow . "#f0e6ae")

    (mid-blue . "#78c8f0")
    (mid-magenta . "#dc78f0")
    (mid-orange . "#f0a078")
    (mid-green . "#8cf078")
    (mid-red . "#f43753")
    (mid-yellow . "#e0d69e")

    (dark-blue . "#042f45")
    (dark-magenta . "#3a0445")
    (dark-orange . "#451a04")
    (dark-green . "#0f4504")
    (dark-red . "#5E262E")
    (dark-yellow . "#3a3f14")))

(defun tsuki-theme-get-color (color palette)
  "Get certain COLOR from PALETTE."
  (cdr (assoc color palette)))


(let* ((white (tsuki-theme-get-color 'white tsuki-theme-palette))
       (gray (tsuki-theme-get-color 'gray tsuki-theme-palette))
       (black (tsuki-theme-get-color 'black tsuki-theme-palette))
       (light-black (tsuki-theme-get-color 'light-black tsuki-theme-palette))

       (yoru (tsuki-theme-get-color 'yoru tsuki-theme-palette))

       (nibi (tsuki-theme-get-color 'nibi tsuki-theme-palette))
       (sumi (tsuki-theme-get-color 'sumi tsuki-theme-palette))
       (kuchiba (tsuki-theme-get-color 'kuchiba tsuki-theme-palette))

       (light-blue (tsuki-theme-get-color 'light-blue tsuki-theme-palette))
       (light-magenta (tsuki-theme-get-color 'light-magenta tsuki-theme-palette))
       (light-orange (tsuki-theme-get-color 'light-orange tsuki-theme-palette))
       (light-green (tsuki-theme-get-color 'light-green tsuki-theme-palette))
       (light-red (tsuki-theme-get-color 'light-red tsuki-theme-palette))
       (light-yellow (tsuki-theme-get-color 'light-yellow tsuki-theme-palette))

       (mid-blue (tsuki-theme-get-color 'mid-blue tsuki-theme-palette))
       (mid-magenta (tsuki-theme-get-color 'mid-magenta tsuki-theme-palette))
       (mid-orange (tsuki-theme-get-color 'mid-orange tsuki-theme-palette))
       (mid-green (tsuki-theme-get-color 'mid-green tsuki-theme-palette))
       (mid-red (tsuki-theme-get-color 'mid-red tsuki-theme-palette))

       (dark-blue (tsuki-theme-get-color 'dark-blue tsuki-theme-palette))
       (dark-magenta (tsuki-theme-get-color 'dark-magenta tsuki-theme-palette))
       (dark-orange (tsuki-theme-get-color 'dark-orange tsuki-theme-palette))
       (dark-green (tsuki-theme-get-color 'dark-green tsuki-theme-palette))
       (dark-red (tsuki-theme-get-color 'dark-red tsuki-theme-palette))
       (dark-yellow (tsuki-theme-get-color 'dark-yellow tsuki-theme-palette)))
  (deftheme tsuki)
  (custom-theme-set-faces
   'tsuki
   `(all-the-icons-blue ((t (:foreground ,mid-blue))))
   `(all-the-icons-blue-alt ((t (:foreground ,mid-blue))))
   `(all-the-icons-completion-dir-face ((t (:inherit font-lock-keyword-face))))
   `(all-the-icons-cyan ((t (:foreground ,mid-blue))))
   `(all-the-icons-cyan-alt ((t (:foreground ,mid-blue))))
   `(all-the-icons-dblue ((t (:foreground ,mid-blue))))
   `(all-the-icons-dcyan ((t (:foreground ,mid-blue))))
   `(all-the-icons-dgreen ((t (:foreground ,mid-green))))
   `(all-the-icons-dired-dir-face ((t (:inherit dired-directory))))
   `(all-the-icons-dmaroon ((t (:foreground ,mid-orange))))
   `(all-the-icons-dorange ((t (:foreground ,mid-orange))))
   `(all-the-icons-dpink ((t (:foreground ,mid-magenta))))
   `(all-the-icons-dpurple ((t (:foreground ,mid-magenta))))
   `(all-the-icons-dred ((t (:foreground ,mid-magenta))))
   `(all-the-icons-dsilver ((t (:foreground ,gray))))
   `(all-the-icons-dyellow ((t (:foreground ,mid-orange))))
   `(all-the-icons-green ((t (:foreground ,mid-green))))
   `(all-the-icons-lblue ((t (:foreground ,mid-blue))))
   `(all-the-icons-lcyan ((t (:foreground ,mid-blue))))
   `(all-the-icons-lgreen ((t (:foreground ,mid-green))))
   `(all-the-icons-lmaroon ((t (:foreground ,mid-orange))))
   `(all-the-icons-lorange ((t (:foreground ,mid-orange))))
   `(all-the-icons-lpink ((t (:foreground ,mid-magenta))))
   `(all-the-icons-lpurple ((t (:foreground ,mid-magenta))))
   `(all-the-icons-lred ((t (:foreground ,mid-magenta))))
   `(all-the-icons-lsilver ((t (:foreground ,gray))))
   `(all-the-icons-lyellow ((t (:foreground ,mid-orange))))
   `(all-the-icons-maroon ((t (:foreground ,mid-orange))))
   `(all-the-icons-orange ((t (:foreground ,mid-orange))))
   `(all-the-icons-pink ((t (:foreground ,mid-magenta))))
   `(all-the-icons-purple ((t (:foreground ,mid-magenta))))
   `(all-the-icons-purple-alt ((t (:foreground ,mid-magenta))))
   `(all-the-icons-red ((t (:foreground ,mid-magenta))))
   `(all-the-icons-red-alt ((t (:foreground ,mid-magenta))))
   `(all-the-icons-silver ((t (:foreground ,gray))))
   `(all-the-icons-yellow ((t (:foreground ,mid-orange))))
   `(ansi-color-black ((t (:foreground ,black :background ,black))))
   `(ansi-color-blue ((t (:foreground ,mid-blue :background ,mid-blue))))
   `(ansi-color-bold ((t (:weight bold))))
   `(ansi-color-bright-black ((t (:foreground ,black :background ,black))))
   `(ansi-color-bright-blue ((t (:foreground ,mid-blue :background ,mid-blue))))
   `(ansi-color-bright-cyan ((t (:foreground ,light-blue :background ,light-blue))))
   `(ansi-color-bright-green ((t (:foreground ,mid-green :background ,dark-green))))
   `(ansi-color-bright-magenta ((t (:foreground ,mid-magenta :background ,mid-magenta))))
   `(ansi-color-bright-red ((t (:foreground ,mid-red :background ,dark-red))))
   `(ansi-color-bright-white ((t (:foreground ,white :background ,white))))
   `(ansi-color-bright-yellow ((t (:foreground ,mid-green :background ,mid-green))))
   `(ansi-color-cyan ((t (:foreground ,mid-blue :background ,mid-blue))))
   `(ansi-color-fast-blink ((t (:box (:line-width -1)))))
   `(ansi-color-green ((t (:foreground ,mid-green :background ,dark-green))))
   `(ansi-color-inverse ((t (:inverse-video t))))
   `(ansi-color-magenta ((t (:foreground ,mid-magenta :background ,mid-magenta))))
   `(ansi-color-red ((t (:foreground ,mid-red :background ,mid-red))))
   `(ansi-color-slow-blink ((t (:box (:line-width -1)))))
   `(ansi-color-white ((t (:foreground ,white :background ,white))))
   `(ansi-color-yellow ((t (:foreground ,mid-green :background ,mid-green))))
   `(bookmark-face ((t (:foreground ,mid-orange))))
   `(change-log-date ((t (:foreground ,mid-orange :inherit default))))
   `(change-log-name ((t (:foreground ,light-green :inherit default))))
   `(company-tooltip-selection ((t (:background ,yoru))))
   `(completions-common-part ((t (:foreground ,light-blue))))
   `(consult-file ((t (:foreground ,light-magenta :background ,dark-magenta))))
   `(consult-separator ((t (:foreground ,black))))
   `(corfu-bar ((t (:background ,gray))))
   `(corfu-border ((t (:background ,mid-blue))))
   `(corfu-current ((t (:foreground ,white :background ,yoru))))
   `(corfu-default ((t (:background ,black))))
   `(cursor ((t (:foreground ,mid-blue :background ,mid-blue))))
   `(custom-button ((t (:foreground ,light-magenta :background ,dark-magenta :box (:color ,mid-magenta :line-width 1)))))
   `(custom-button-mouse ((t (:inherit custom-button))))
   `(custom-button-pressed ((t (:inherit custom-button))))
   `(custom-changed ((t (:foreground ,white :background ,dark-blue))))
   `(custom-comment ((t (:background ,gray))))
   `(custom-comment-tag ((t (:foreground ,white))))
   `(custom-invalid ((t (:inherit error))))
   `(custom-modified ((t (:foreground ,white :background ,dark-blue))))
   `(custom-rogue ((t (:foreground ,light-orange :background ,black))))
   `(custom-set ((t (:foreground ,dark-blue :background ,white))))
   `(custom-state ((t (:foreground ,mid-green))))
   `(custom-themed ((t (:foreground ,white :background ,dark-blue))))
   `(custom-variable-obsolete ((t (:foreground ,light-blue))))
   `(custom-variable-tag ((t (:weight bold :foreground ,light-blue))))
   `(default ((t (:foreground ,white :background ,black))))
   `(dgi-commit-message-face ((t (:foreground ,nibi))))
   `(diary ((t (:foreground ,mid-green))))
   `(diff-added ((t (:foreground ,mid-green :background ,dark-green))))
   `(diff-changed ((t (:foreground ,mid-magenta :background ,dark-magenta))))
   `(diff-context ((t (:foreground ,gray :extend t))))
   `(diff-error ((t (:weight bold :inherit error))))
   `(diff-file-header ((t (:inherit font-lock-keyword-face))))
   `(diff-header ((t (:foreground ,mid-blue :background ,dark-blue))))
   `(diff-hl-change ((t (:inherit diff-changed))))
   `(diff-hl-delete ((t (:inherit diff-removed))))
   `(diff-hl-insert ((t (:inherit diff-added))))
   `(diff-hl-reverted-hunk-highlight ((t (:inverse-video t))))
   `(diff-refine-changed ((t (:background ,mid-green))))
   `(diff-removed ((t (:foreground ,mid-red :background ,dark-red))))
   `(dired-broken-symlink ((t (:weight bold :inherit error))))
   `(dired-directory ((t (:inherit font-lock-keyword-face))))
   `(edebug-disabled-breakpoint ((t (:extend t :background ,dark-green))))
   `(eglot-highlight-symbol-face ((t (:weight bold :underline (:style line)))))
   `(eldoc-box-body ((t (:foreground ,mid-blue :background ,dark-blue))))
   `(eldoc-box-border ((t (:background ,mid-blue))))
   `(elpaca-info-package ((t (:inherit font-lock-keyword-face))))
   `(embark-verbose-indicator-title ((t (:inherit mode-line-active))))
   `(embark-verbose-indicator-title ((t (:inherit mode-line-active))))
   `(epa-field-body ((t (:slant italic :foreground ,light-blue))))
   `(epa-field-name ((t (:weight bold :foreground ,light-blue))))
   `(epa-mark ((t (:weight bold :foreground ,mid-orange))))
   `(epa-string ((t (:foreground ,white))))
   `(epa-validity-disabled ((t (:slant italic :inverse-video t))))
   `(epa-validity-high ((t (:weight bold :foreground ,light-blue))))
   `(epa-validity-medium ((t (:slant italic :foreground ,light-blue))))
   `(error ((t (:weight bold :foreground ,mid-red :background ,dark-red))))
   `(escape-glyph ((t (:foreground ,light-blue))))
   `(eww-form-checkbox ((t (:box (:line-width 2 :style 'released-button))) :foreground ,black :background ,white))
   `(eww-form-file ((t (:box (:line-width 2 :style 'released-button))) :foreground ,black :background ,gray))
   `(eww-form-select ((t (:box (:line-width 2 :style 'released-button))) :foreground ,black :background ,white))
   `(eww-form-submit ((t (:box (:line-width 2 :style 'released-button))) :foreground ,black :background ,gray))
   `(eww-form-text ((t (:box (:line-width 1))) :foreground ,white :background ,black))
   `(eww-form-textarea ((t (:box (:line-width 1))) :foreground ,black :background ,white))
   `(eww-invalid-certificate ((t (:weight bold :inherit error))))
   `(eww-valid-certificate ((t (:weight bold :foreground ,dark-green))))
   `(fancy-compilation-complete-error-face ((t (:inherit error :extend t))))
   `(fancy-compilation-complete-success-face ((t (:inherit success :extend t))))
   `(fancy-compilation-default-face ((t (:inherit default))))
   `(flycheck-error ((t (:background ,dark-red :underline (:style wave :color ,mid-red)))))
   `(flycheck-fringe-error ((t (:foreground ,mid-red :background ,dark-red))))
   `(flycheck-fringe-info ((t (:foreground ,mid-green :background ,dark-green))))
   `(flycheck-fringe-warning ((t (:foreground ,mid-magenta :background ,dark-magenta))))
   `(flycheck-info ((t (:background ,dark-green :underline (:style wave :color ,light-green)))))
   `(flycheck-posframe-background-face ((t (:inherit tooltip))))
   `(flycheck-posframe-border-face ((t (:foreground ,mid-blue))))
   `(flycheck-posframe-face ((t (:foreground ,mid-blue))))
   `(flycheck-verify-select-checker ((t (:box (:style 'released-button)))))
   `(flycheck-warning ((t (:background ,dark-magenta :underline (:style wave :color ,light-magenta)))))
   `(flymake-error ((t (:background ,dark-red :underline (:style wave :color ,mid-red)))))
   `(flymake-note ((t (:background ,dark-green :underline (:style wave :color ,light-green)))))
   `(flymake-posframe-border-face ((t (:foreground ,mid-blue))))
   `(flymake-posframe-face ((t (:foreground ,mid-blue :inherit tooltip))))
   `(flymake-warning ((t (:background ,dark-magenta :underline (:style wave :color ,light-magenta)))))
   `(font-lock-builtin-face ((t (:foreground ,light-magenta :background ,dark-magenta))))
   `(font-lock-comment-face ((t (:foreground ,nibi :background ,dark-blue))))
   `(font-lock-constant-face ((t (:foreground ,light-green :background ,dark-green))))
   `(font-lock-doc-face ((t (:inherit font-lock-preprocessor-face))))
   `(font-lock-function-name-face ((t (:foreground ,light-yellow :background ,dark-yellow))))
   `(font-lock-keyword-face ((t (:foreground ,mid-blue :background ,dark-blue))))
   `(font-lock-preprocessor-face ((t (:foreground ,kuchiba :background ,dark-orange))))
   `(font-lock-string-face ((t (:foreground ,mid-orange :background ,dark-orange))))
   `(font-lock-type-face ((t (:foreground ,light-green :background ,dark-green))))
   `(font-lock-variable-name-face ((t (:inherit font-lock-function-name-face))))
   `(font-lock-warning-face ((t (:inherit warning))))
   `(fringe ((t (:foreground ,gray :background ,black))))
   `(git-commit-comment-action ((t (:inherit font-lock-comment-face))))
   `(git-commit-comment-branch-local ((t (:inherit font-lock-comment-face))))
   `(git-commit-comment-branch-remote ((t (:inherit font-lock-comment-face))))
   `(git-commit-comment-detached ((t (:inherit font-lock-comment-face))))
   `(git-commit-comment-file ((t (:inherit font-lock-comment-face))))
   `(git-commit-comment-heading ((t (:inherit font-lock-comment-face))))
   `(git-commit-comment-keyword ((t (:inherit font-lock-comment-face))))
   `(git-commit-known-pseudo-header ((t (:inherit git-commit-pseudo-header))))
   `(git-commit-nonempty-second-line ((t (:inherit warning))))
   `(git-commit-note ((t (:inherit default))))
   `(git-commit-overlong-summary ((t (:inherit warning))))
   `(git-commit-pseudo-header ((t (:inherit log-edit-unknown-header))))
   `(git-commit-summary ((t (:inherit log-edit-summary))))
   `(glyphless-char ((t (:height 0.6))))
   `(gnus-emphasis-highlight-words ((t (:foreground ,mid-green :background ,black))))
   `(gnus-emphasis-strikethru ((t (:strike-through t))))
   `(gnus-group-mail-1-empty ((t (:foreground ,light-green))))
   `(gnus-group-mail-2-empty ((t (:foreground ,light-green))))
   `(gnus-group-mail-3-empty ((t (:foreground ,light-green))))
   `(gnus-group-mail-low-empty ((t (:foreground ,light-green))))
   `(gnus-group-news-1-empty ((t (:foreground ,light-blue))))
   `(gnus-group-news-2-empty ((t (:foreground ,light-blue))))
   `(gnus-group-news-low-empty ((t (:foreground ,mid-blue))))
   `(gnus-splash ((t (:foreground ,white))))
   `(gnus-summary-cancelled ((t (:extend t :foreground ,mid-green :background ,black))))
   `(gnus-summary-normal-ancient ((t (:extend t :foreground ,mid-blue))))
   `(gnus-summary-normal-read ((t (:extend t :foreground ,mid-green))))
   `(gnus-summary-normal-ticked ((t (:extend t :foreground ,light-orange))))
   `(gnus-summary-normal-undownloaded ((t (:weight normal :extend t :foreground ,white))))
   `(gnus-summary-normal-unread ((t (:extend t))))
   `(haskell-operator-face ((t (:inherit font-lock-builtin-face))))
   `(header-line ((t (:inherit mode-line))))
   `(help-for-help-header ((t (:height 1.26))))
   `(highlight ((t (:background ,yoru))))
   `(holiday ((t (:background ,dark-orange))))
   `(homoglyph ((t (:foreground ,light-blue))))
   `(ibuffer-locked-buffer ((t (:foreground ,light-orange))))
   `(ido-indicator ((t (:foreground ,mid-green :background ,light-red))))
   `(ido-only-match ((t (:foreground ,dark-green))))
   `(ido-subdir ((t (:foreground ,light-red))))
   `(info-menu-star ((t (:foreground ,light-red))))
   `(info-node ((t (:weight bold :slant italic :foreground ,white))))
   `(info-title-1 ((t (:inherit info-title-2))))
   `(info-title-2 ((t (:inherit info-title-3))))
   `(info-title-3 ((t (:inherit info-title-4))))
   `(info-title-4 ((t (:weight bold :inherit font-lock-keyword-face))))
   `(isearch ((t (:foreground ,mid-red :background ,dark-red))))
   `(isearch-fail ((t (:background ,dark-orange))))
   `(isearch-group-1 ((t (:foreground ,dark-red :background ,light-magenta))))
   `(isearch-group-2 ((t (:foreground ,dark-red :background ,light-red))))
   `(lazy-highlight ((t (:foreground ,light-green :background ,dark-green))))
   `(line-number ((t (:foreground ,gray))))
   `(line-number-current-line ((t (:weight bold))))
   `(line-number-major-tick ((t (:weight bold :background ,white))))
   `(line-number-minor-tick ((t (:weight bold :background ,gray))))
   `(link ((t (:foreground ,light-green :background ,dark-green :underline (:style line)))))
   `(link-visited ((t (:inherit link))))
   `(log-view-message ((t (:foreground ,mid-magenta))))
   `(lsp-installation-buffer-face ((t (:foreground ,mid-green))))
   `(lsp-installation-finished-buffer-face ((t (:foreground ,mid-orange))))
   `(lsp-ui-doc-background ((t (:background ,black))))
   `(lsp-ui-doc-header ((t (:foreground ,black :background ,mid-blue))))
   `(lsp-ui-peek-filename ((t (:foreground ,mid-orange))))
   `(lsp-ui-peek-header ((t (:foreground ,black :background ,white))))
   `(lsp-ui-peek-highlight ((t (:box (:line-width -1 :color ,light-red))) :foreground ,black :background ,white))
   `(lsp-ui-peek-line-number ((t (:foreground ,black))))
   `(lsp-ui-peek-list ((t (:background ,black))))
   `(lsp-ui-peek-peek ((t (:background ,sumi))))
   `(lsp-ui-peek-selection ((t (:foreground ,black :background ,white))))
   `(lv-separator ((t (:background ,black))))
   `(magit-bisect-bad ((t (:inherit error))))
   `(magit-bisect-good ((t (:inherit success))))
   `(magit-bisect-skip ((t (:inherit warning))))
   `(magit-blame-date ((t (:inherit change-log-date))))
   `(magit-blame-dimmed ((t (:inherit shadow))))
   `(magit-blame-hash ((t (:inherit log-view-message))))
   `(magit-blame-heading ((t (:inherit header-line))))
   `(magit-blame-highlight ((t (:extend t :foreground ,white :background ,black))))
   `(magit-blame-name ((t (:inherit change-log-name))))
   `(magit-blame-summary ((t (:inherit magit-blame-heading))))
   `(magit-branch-current ((t (:inherit magit-branch-local :weight bold))))
   `(magit-branch-local ((t (:inherit change-log-list))))
   `(magit-branch-remote ((t (:inherit change-log-list))))
   `(magit-branch-remote-head ((t (:inherit magit-branch-remote :weight bold))))
   `(magit-branch-upstream ((t (:inherit change-log-list :inverse-video t))))
   `(magit-cherry-equivalent ((t (:inherit success))))
   `(magit-cherry-unmatched ((t (:inherit warning))))
   `(magit-diff-added ((t (:foreground ,mid-green :background ,dark-green))))
   `(magit-diff-added-highlight ((t (:inherit magit-diff-added))))
   `(magit-diff-base ((t (:inherit ediff-current-diff-Ancestor))))
   `(magit-diff-base-highlight ((t (:inherit magit-diff-base))))
   `(magit-diff-context ((t (:inherit diff-context))))
   `(magit-diff-context-highlight ((t (:inherit magit-diff-context))))
   `(magit-diff-file-heading ((t (:inherit diff-file-header))))
   `(magit-diff-file-heading-highlight ((t (:inherit magit-diff-file-heading))))
   `(magit-diff-file-heading-selection ((t (:inherit magit-diff-file-heading))))
   `(magit-diff-hunk-heading ((t (:inherit diff-hunk-header))))
   `(magit-diff-hunk-heading-highlight ((t (:inherit magit-diff-hunk-heading))))
   `(magit-diff-hunk-heading-selection ((t (:inherit magit-diff-hunk-heading))))
   `(magit-diff-hunk-region ((t (:inherit default))))
   `(magit-diff-lines-boundary ((t (:background ,mid-blue))))
   `(magit-diff-lines-heading nil)
   `(magit-diff-our ((t (:inherit ediff-current-diff-A))))
   `(magit-diff-our-highlight ((t (:inherit magit-diff-our))))
   `(magit-diff-removed ((t (:foreground ,mid-red :background ,dark-red))))
   `(magit-diff-removed-highlight ((t (:inherit magit-diff-removed))))
   `(magit-diff-their ((t (:inherit ediff-current-diff-C))))
   `(magit-diff-their-highlight ((t (:inherit magit-diff-their))))
   `(magit-diff-whitespace-warning ((t (:inherit trailing-whitespace))))
   `(magit-diffstat-added ((t (:inherit diff-added))))
   `(magit-diffstat-removed ((t (:inherit magit-diffstat-removed))))
   `(magit-dimmed ((t (:inherit shadow))))
   `(magit-filename ((t (:inherit change-log-file))))
   `(magit-hash ((t (:inherit log-view-message))))
   `(magit-head ((t (:inherit change-log-list :inverse-video t))))
   `(magit-header-line ((t (:foreground ,light-blue :background ,yoru :box (:color ,mid-blue :line-width 1)))))
   `(magit-keyword ((t (:inherit default))))
   `(magit-log-author ((t (:inherit change-log-name))))
   `(magit-log-date ((t (:inherit change-log-date))))
   `(magit-log-graph ((t (:foreground ,kuchiba))))
   `(magit-mode-line-process ((t (:inherit mode-line-emphasis))))
   `(magit-mode-line-process-error ((t (:inherit error))))
   `(magit-process-ng ((t (:inherit error))))
   `(magit-process-ok ((t (:inherit success))))
   `(magit-reflog-amend ((t (:inherit log-view-message))))
   `(magit-reflog-checkout ((t (:inherit log-view-message))))
   `(magit-reflog-cherry-pick ((t (:inherit log-view-message))))
   `(magit-reflog-commit ((t (:inherit log-view-message))))
   `(magit-reflog-merge ((t (:inherit log-view-message))))
   `(magit-reflog-other ((t (:inherit log-view-message))))
   `(magit-reflog-rebase ((t (:inherit log-view-message))))
   `(magit-reflog-remote ((t (:inherit log-view-message))))
   `(magit-reflog-reset ((t (:inherit log-view-message))))
   `(magit-refname ((t (:inherit change-log-list))))
   `(magit-refname-stash ((t (:inherit magit-refname))))
   `(magit-refname-wip ((t (:inherit magit-refname))))
   `(magit-section-heading ((t (:inherit font-lock-type-face))))
   `(magit-section-heading-secondary-heading ((t (:inherit magit-section-heading-selection))))
   `(magit-section-heading-selection ((t (:weight bold))))
   `(magit-section-highlight ((t (:background ,light-black :extend t))))
   `(magit-sequence-done ((t (:inherit success))))
   `(magit-sequence-drop ((t (:inherit error))))
   `(magit-sequence-head ((t (:inherit default :weight bold))))
   `(magit-sequence-onto ((t (:inherit success :weight bold))))
   `(magit-sequence-part ((t (:inherit default))))
   `(magit-sequence-pick ((t (:inherit warning))))
   `(magit-sequence-stop ((t (:inherit default :weight bold))))
   `(magit-signature-bad ((t (:inherit error))))
   `(magit-signature-error ((t (:inherit error :weight bold))))
   `(magit-signature-expired ((t (:inherit warning))))
   `(magit-signature-expired-key ((t (:inherit warning))))
   `(magit-signature-good ((t (:inherit success))))
   `(magit-signature-revoked ((t (:inherit warning))))
   `(magit-signature-untrusted ((t (:inherit warning :weight bold))))
   `(magit-tag ((t (:inherit change-log-list))))
   `(markdown-code-face ((t (:background ,dark-blue :extend t))))
   `(markdown-highlighting-face ((t (:foreground ,black :background ,mid-green))))
   `(markdown-inline-code-face ((t (:inherit markdown-code-face))))
   `(markdown-pre-face ((t (:inherit markdown-code-face))))
   `(match ((t (:inherit highlight))))
   `(mc/cursor-bar-face ((t (:height 1 :background ,mid-blue))))
   `(mc/cursor-face ((t (:inverse-video t))))
   `(menu ((t (:inverse-video t))))
   `(message-cited-text-1 ((t (:foreground ,light-orange))))
   `(message-cited-text-2 ((t (:foreground ,dark-green))))
   `(message-cited-text-3 ((t (:foreground ,mid-orange))))
   `(message-cited-text-4 ((t (:foreground ,mid-orange))))
   `(message-header-cc ((t (:weight bold :foreground ,mid-green))))
   `(message-header-name ((t (:foreground ,mid-green))))
   `(message-header-newsgroups ((t (:weight bold :slant italic :foreground ,mid-green))))
   `(message-header-other ((t (:foreground ,light-red))))
   `(message-header-subject ((t (:foreground ,mid-green))))
   `(message-header-to ((t (:weight bold :foreground ,mid-green))))
   `(message-header-xheader ((t (:foreground ,mid-blue))))
   `(message-mml ((t (:foreground ,mid-green))))
   `(message-separator ((t (:foreground ,light-blue))))
   `(mini-popup-border ((t (:foreground ,light-blue :background ,light-blue))))
   `(minibuffer-prompt ((t (:inherit font-lock-type-face))))
   `(mm-command-output ((t (:foreground ,dark-green))))
   `(mm-uu-extract ((t (:extend t :foreground ,white :background ,dark-green))))
   `(mode-line ((t (:foreground ,mid-blue :background ,yoru :box (:color ,mid-blue :line-width 1)))))
   `(mode-line-active ((t (:inherit mode-line))))
   `(mode-line-highlight ((t (:background ,mid-blue))))
   `(mode-line-inactive ((t (:foreground ,mid-blue :background ,dark-blue :box (:color ,mid-blue :line-width 1)))))
   `(nerd-icons-completion-dir-face ((t (:inherit font-lock-keyword-face))))
   `(nerd-icons-dired-dir-face ((t (:inherit font-lock-keyword-face))))
   `(nobreak-hyphen ((t (:foreground ,light-blue))))
   `(ns-marked-text-face ((t (:underline ,white))))
   `(ns-unmarked-text-face ((t (:underline ,black))))
   `(ns-working-text-face ((t (:underline ,white))))
   `(orderless-match-face-0 ((t (:weight bold :foreground ,mid-blue))))
   `(orderless-match-face-1 ((t (:weight bold :foreground ,light-magenta))))
   `(orderless-match-face-2 ((t (:weight bold :foreground ,mid-green))))
   `(orderless-match-face-3 ((t (:weight bold :foreground ,light-orange))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,gray))))
   `(org-agenda-done ((t (:foreground ,mid-green))))
   `(org-agenda-restriction-lock ((t (:background ,black))))
   `(org-agenda-structure ((t (:foreground ,mid-blue))))
   `(org-block ((t (:background ,sumi :extend t))))
   `(org-block-begin-line ((t (:foreground ,nibi :background ,dark-blue :extend t))))
   `(org-block-end-line ((t (:foreground ,nibi :background ,dark-blue :extend t))))
   `(org-clock-overlay ((t (:foreground ,white :background ,nibi))))
   `(org-column ((t (:weight normal :slant normal :underline nil :strike-through nil :background ,black))))
   `(org-column-title ((t (:weight bold :underline t :background ,black))))
   `(org-date ((t (:underline t :foreground ,light-blue))))
   `(org-date-selected ((t (:inverse-video t :foreground ,light-orange))))
   `(org-dispatcher-highlight ((t (:weight bold :foreground ,light-orange :background ,black))))
   `(org-document-info ((t (:foreground ,light-blue))))
   `(org-document-title ((t (:weight bold :foreground ,light-blue))))
   `(org-done ((t (:weight bold :foreground ,mid-green))))
   `(org-drawer ((t (:foreground ,mid-blue))))
   `(org-ellipsis ((t (:underline t :foreground ,light-green))))
   `(org-footnote ((t (:underline t :foreground ,light-blue))))
   `(org-formula ((t (:foreground ,mid-orange))))
   `(org-headline-done ((t (:foreground ,mid-green))))
   `(org-headline-todo ((t (:foreground ,light-magenta))))
   `(org-hide ((t (:foreground ,black))))
   `(org-latex-and-related ((t (:foreground ,light-orange))))
   `(org-scheduled ((t (:foreground ,mid-green))))
   `(org-scheduled-previously ((t (:foreground ,mid-orange))))
   `(org-scheduled-today ((t (:foreground ,mid-green))))
   `(org-sexp-date ((t (:foreground ,light-blue))))
   `(org-table ((t (:foreground ,mid-blue))))
   `(org-time-grid ((t (:foreground ,light-green))))
   `(org-todo ((t (:foreground ,light-magenta :background ,dark-magenta))))
   `(org-upcoming-deadline ((t (:foreground ,mid-orange))))
   `(outline-1 ((t (:inherit font-lock-keyword-face))))
   `(outline-2 ((t (:inherit font-lock-type-face))))
   `(outline-3 ((t (:inherit font-lock-variable-name-face))))
   `(outline-4 ((t (:inherit font-lock-doc-face))))
   `(outline-5 ((t (:inherit font-lock-keyword-face))))
   `(outline-6 ((t (:inherit font-lock-type-face))))
   `(outline-7 ((t (:inherit font-lock-variable-name-face))))
   `(outline-8 ((t (:inherit font-lock-doc-face))))
   `(pulse-highlight-face ((t (:extend nil :background ,mid-green))))
   `(pulse-highlight-start-face ((t (:background ,mid-green))))
   `(region ((t (:background ,yoru :extend t))))
   `(ruri-checker-error ((t (:foreground ,mid-red :background ,dark-red))))
   `(ruri-checker-info ((t (:foreground ,mid-green :background ,dark-green))))
   `(ruri-checker-warning ((t (:foreground ,mid-orange :background ,dark-orange))))
   `(ruri-summary-body ((t (:background ,dark-blue :weight bold))))
   `(ruri-summary-secondary ((t (:foreground ,white :background ,dark-blue))))
   `(secondary-selection ((t (:inherit highlight))))
   `(separator-line ((t (:height 0.1 :background ,black))))
   `(sh-heredoc ((t (:inherit font-lock-string-face))))
   `(shadow ((t (:foreground ,gray))))
   `(show-paren-match ((t (:foreground ,mid-green :background ,dark-green :underline t))))
   `(show-paren-mismatch ((t (:foreground ,mid-red :background ,dark-red :underline t))))
   `(shr-code ((t (:inherit default))))
   `(shr-mark ((t (:foreground ,black :background ,mid-green))))
   `(shr-strike-through ((t (:strike-through t))))
   `(shr-sup ((t (:height 0.8))))
   `(shr-text ((t (:inherit default))))
   `(smerge-base ((t (:extend t :background ,dark-green))))
   `(smerge-lower ((t (:extend t :background ,dark-green))))
   `(smerge-markers ((t (:inherit font-lock-doc-face))))
   `(smerge-upper ((t (:extend t :background ,dark-red))))
   `(straight-process-command ((t (:inherit font-lock-function-name-face))))
   `(straight-process-error ((t (:inherit diff-error))))
   `(success ((t (:foreground ,light-green :background ,dark-green))))
   `(tab-bar ((t (:inherit mode-line))))
   `(tab-line ((t (:inherit mode-line))))
   `(tabulated-list-fake-header ((t (:weight bold :underline t :overline t))))
   `(tool-bar ((t (:box (:line-width 1 :style 'released-button))) :foreground ,black :background ,white))
   `(tooltip ((t (:foreground ,white :background ,dark-blue :box (:color ,mid-blue :line-width 1)))))
   `(trailing-whitespace ((t (:background ,mid-red))))
   `(transient-disabled-suffix ((t (:weight bold :foreground ,black :background ,light-red))))
   `(transient-enabled-suffix ((t (:weight bold :foreground ,black :background ,mid-green))))
   `(transient-separator ((t (:extend t :background ,black))))
   `(treemacs-all-the-icons-file-face ((t (:inherit font-lock-keyword-face))))
   `(treemacs-all-the-icons-root-face ((t (:inherit font-lock-keyword-face))))
   `(tty-menu-disabled-face ((t (:foreground ,white :background ,yoru))))
   `(tty-menu-enabled-face ((t (:weight bold :foreground ,mid-green :background ,yoru))))
   `(tty-menu-selected-face ((t (:background ,light-red))))
   `(vertical-border ((t (:foreground ,mid-blue))))
   `(vundo-default ((t (:foreground ,gray))))
   `(vundo-highlight ((t (:foreground ,light-green :background ,dark-green :inherit vundo-default))))
   `(warning ((t (:weight bold :foreground ,mid-orange :background ,dark-orange))))
   `(which-func ((t (:foreground ,dark-blue))))
   `(whitespace-big-indent ((t (:foreground ,mid-red :background ,light-red))))
   `(whitespace-empty ((t (:extend t :foreground ,mid-red :background ,mid-green))))
   `(whitespace-hspace ((t (:foreground ,gray :background ,black))))
   `(whitespace-indentation ((t (:foreground ,mid-red :background ,mid-green))))
   `(whitespace-line ((t (:foreground ,mid-magenta :background ,black))))
   `(whitespace-missing-newline-at-eof ((t (:foreground ,black :background ,mid-green))))
   `(whitespace-newline ((t (:weight normal :foreground ,gray))))
   `(whitespace-space ((t (:foreground ,gray :background ,black))))
   `(whitespace-space-after-tab ((t (:foreground ,mid-red :background ,mid-green))))
   `(whitespace-space-before-tab ((t (:foreground ,mid-red :background ,mid-orange))))
   `(whitespace-tab ((t (:foreground ,gray :background ,black))))
   `(whitespace-trailing ((t (:foreground ,mid-red :background ,dark-red))))
   `(widget-button-pressed ((t (:foreground ,light-red))))
   `(widget-documentation ((t (:foreground ,mid-green))))
   `(widget-field ((t (:extend t :box (:line-width 1 :color ,gray))) :background ,gray))
   `(widget-single-line-field ((t (:background ,gray))))
   `(window-divider ((t (:foreground ,mid-blue))))
   `(window-divider-first-pixel ((t (:foreground ,mid-blue))))
   `(window-divider-last-pixel ((t (:foreground ,mid-blue))))
   )
  (provide-theme 'tsuki))

;;; tsuki-theme.el ends here

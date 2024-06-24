;;; tools/lsp/+lspce.el -*- lexical-binding: t; -*-

(use-package! lspce
  :config (progn
            (setq lspce-send-changes-idle-time 1)
            (setq lspce-show-log-level-in-modeline t) ;; show log level in mode line

            ;; You should call this first if you want lspce to write logs
            (lspce-set-log-file "/tmp/lspce.log")

            ;; By default, lspce will not write log out to anywhere.
            ;; To enable logging, you can add the following line
            ;; (lspce-enable-logging)
            ;; You can enable/disable logging on the fly by calling `lspce-enable-logging' or `lspce-disable-logging'.

            ;; enable lspce in particular buffers
            ;; (add-hook 'rust-mode-hook 'lspce-mode)

            ;; modify `lspce-server-programs' to add or change a lsp server, see document
            ;; of `lspce-lsp-type-function' to understand how to get buffer's lsp type.
            ;; Bellow is what I use
            (setq lspce-server-programs `(("rust"  "rust-analyzer" "" lspce-ra-initializationOptions)
                                          ("python" "pylsp" "" )
                                          ("C" "clangd" "--all-scopes-completion --clang-tidy --enable-config --header-insertion-decorators=0")
                                          ("java" "java" lspce-jdtls-cmd-args lspce-jdtls-initializationOptions)
                                          ))
            )
  )

;; -*- no-byte-compile: t; -*-
;;; tools/lsp/packages.el

;; (if (modulep! +eglot)
;;     (progn
;;       (package! eglot :pin "678610fdc544f10ac757ab7acf88ac7c5815ed5a")
;;       (when (modulep! :completion vertico)
;;         (package! consult-eglot :pin "64262e72452f8fe6dd49d31bcdd4bd577b7d682d"))
;;       (when (and (modulep! :checkers syntax)
;;              (not (modulep! :checkers syntax +flymake)))
;;         (package! flycheck-eglot :pin "114e1315aaf0dc3196da67da426bbe2b46384fe2")))
;;   (package! lsp-mode :pin "8861252880f6c2f6374a7bca2b945e6447eebd5a")
;;   (package! lsp-ui :pin "942eeecc3d9a23ad006a3476885dfa7cbb5e207e")
;;   (when (modulep! :completion ivy)
;;     (package! lsp-ivy :pin "9ecf4dd9b1207109802bd1882aa621eb1c385106"))
;;   (when (modulep! :completion helm)
;;     (package! helm-lsp :pin "c2c6974dadfac459b1a69a1217441283874cea92"))
;;   (when (modulep! :completion vertico)
;;     (package! consult-lsp :pin "f8db3252c0daa41225ba4ed1c0d178b281cd3e90")))
(cond ((modulep! +eglot)
       (progn
         (package! eglot :pin "678610fdc544f10ac757ab7acf88ac7c5815ed5a")
         (when (modulep! :completion vertico)
           (package! consult-eglot :pin "64262e72452f8fe6dd49d31bcdd4bd577b7d682d"))
         (when (and (modulep! :checkers syntax)
                    (not (modulep! :checkers syntax +flymake)))
           (package! flycheck-eglot :pin "114e1315aaf0dc3196da67da426bbe2b46384fe2"))))
      ((modulep! +lspce)
       (progn
         (package! f.el)
         (package! yasnippet)
         (package! markdown-mode)
         (package! lspce :recipe
           (:host github
            :repo "zbelial/lspce"
   	        :files (:defaults "lspce-module.so")))))
;   	        :files (:defaults ,(pcase system-type
;                                 ('gnu/linux "lspce-module.so")
;                                 ('darwin "lspce-module.dylib")))
;            :build (:not compile)))))
;		          :pre-build ,(pcase system-type
;                                ('gnu/linux '(("cargo" "build" "--release") ("cp" "./target/release/liblspce_module.so" "./lspce-module.so")))
;                                ('darwin '(("cargo" "build" "--release") ("cp" "./target/release/liblspce_module.dylib" "./lspce-module.dylib"))))))))
      (t (progn
           (package! lsp-mode :pin "8861252880f6c2f6374a7bca2b945e6447eebd5a")
           (package! lsp-ui :pin "942eeecc3d9a23ad006a3476885dfa7cbb5e207e")
           (when (modulep! :completion ivy)
             (package! lsp-ivy :pin "9ecf4dd9b1207109802bd1882aa621eb1c385106"))
           (when (modulep! :completion helm)
             (package! helm-lsp :pin "c2c6974dadfac459b1a69a1217441283874cea92"))
           (when (modulep! :completion vertico)
             (package! consult-lsp :pin "f8db3252c0daa41225ba4ed1c0d178b281cd3e90")))))

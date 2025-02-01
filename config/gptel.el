(require 'gptel)

(defun get-anthropic-api-key ()
  "Retrieve the API key from auth-sources."
  (let ((entry (auth-source-search
                :host "anthropic"   ;; The "machine" name used in .authinfo.gpg
                :user "doesnotmatter"      ;; The "login" used
                :max 1)))            ;; Retrieve only one match
    (if entry
        (let ((api-key (plist-get (car entry) :secret)))
          (if (functionp api-key)
              (funcall api-key)  ;; If :secret is a function (for GPG), call it to get the secret
            api-key))
      (error "Anthropic API key not found"))))

(defun gptel-lk-toggle-debug ()
  "Toggle gptel debug mode on and off"
  (interactive)
  (if gptel-log-level
      (setq gptel-log-level nil)
    (setq gptel-log-level 'debug))
  (message "GPTel debug mode is now %s" (if gptel-log-level "ON" "OFF")))

(defun setup-lk-gptel ()
  "Setup gptel for this machine.

 Needs to be called since at start password can't be input"
  (interactive)
   (setq gptel-model 'claude-3-5-sonnet-20240620)
   (setq gptel-backend (gptel-make-anthropic "Claude"
			 :stream t :key (get-anthropic-api-key)))
   )

(setup-lk-gptel)

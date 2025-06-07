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

(defun setup-ollama ()
  "Setup ollama that's running locally as current gptel

Check all models here: https://ollama.com/library
"
  (interactive)
  (setq
   gptel-backend (gptel-make-ollama "Ollama"             ;Any name of your choosing
    :host "localhost:11434"               ;Where it's running
    :stream t                             ;Stream responses
    :models '(deepseek-r1:32b mistral:latest))          ;List of models
    ))

(defun setup-claude ()
  "Setup gptel with claude"
  (interactive)
  (setq gptel-model 'claude-3-5-sonnet-20240620)
  (setq gptel-backend (gptel-make-anthropic "Claude"
			:stream t :key (get-anthropic-api-key)))
  )


(defun gptel-lk-toggle-debug ()
  "Toggle gptel debug mode on and off"
  (interactive)
  (if gptel-log-level
      (setq gptel-log-level nil)
    (setq gptel-log-level 'debug))
  (message "GPTel debug mode is now %s" (if gptel-log-level "ON" "OFF")))


;; (setq gptel-directives
;; ((default  . "You are a large language model living in Emacs and a helpful assistant. Respond concisely.")
;;  (programming . "You are a large language model and a careful programmer. Provide code and only code as output without any additional text, prompt or note.")
;;  (writing . "You are a large language model and a writing assistant. Respond concisely.")
;;  (chat . "You are a large language model and a conversation partner. Respond concisely.")
;;  (research . "You are a large language model and a research assistant. Provide detailed and accurate information.")
;;  (creative . "You are a large language model and a creative assistant. Generate imaginative content.")
;; ))


;; how to append new directives
(setf gptel-directives (append gptel-directives '((research  . "You are a research assistant."))))
(setup-ollama) ; the default

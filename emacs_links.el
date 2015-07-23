
  (defun job-search (to-search)
    (call-process-shell-command
      (concat
        "google-chrome \
'http://search.51job.com/jobsearch/search_result.php?fromJs=1&jobarea=020000%2C00&funtype=0000&industrytype=00&keyword="
        (s-join "%20%20" (split-string  to-search " ")) "'")))


  (defun docker-search (to-search)
    (call-process-shell-command
      (concat
        "google-chrome \
'https://registry.hub.docker.com/search?q="
        (s-join "+" (split-string  to-search " ")) "&s=stars'")))


(add-hook 'org-mode-hook
  '(lambda() (interactive)
    (progn
      (org-add-link-type "job" 'job-search)
      (org-add-link-type "docker" 'docker-search))))

(provide 'url-link)

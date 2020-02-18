# Non-text email
The /etc/mailcap file is essential to display non-plaintext mails containing HTML, Word or PDF:

text/html;w3m -I %{charset} -T text/html; copiousoutput
application/msword; antiword %s; copiousoutput
application/pdf; pdftotext -layout /dev/stdin -; copiousoutput

# Colours
The default colours are fine

But there is a `mutt-colors-solarized` git repo that allows you to download a small collection of nice colour themes to source in your `~/.mutt/config`.

I am not sure if the `LS_COLORS` terminal env variable influences any part of mutt, maybe only when it opens external editors?

# Non-text email
The /etc/mailcap file is essential to display non-plaintext mails containing HTML, Word or PDF:

text/html;w3m -I %{charset} -T text/html; copiousoutput
application/msword; antiword %s; copiousoutput
application/pdf; pdftotext -layout /dev/stdin -; copiousoutput

# See also
[[Plain text]]

https://useplaintext.email/ : advocating the use of plaintext email!
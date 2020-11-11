Having your own domain provides many benefits:
- full control of things
- your own nameserver?

# Recommended domain registrars - NAMECHEAP.com
namecheap.com - they seem to have a good rep on hn

## URL redirect problem
I had a massive problem with my BROWSER not being able to use new domain address `http://aaronkelly.dev` to redirect to my blog `https://aaronpkelly.github.io`.

Turns out my domain was being served over HTTP only, and the browser always attempted to upgrade the connection from http://aaronkelly.dev to https://aaronkelly.dev

That didn't work, and I always saw a connection refused message. Curl would work fine.

Disable this in firefox via `about:config`: `network.stricttransportsecurity.preloadlist=false`

## getting a SSL cert for that HTTPS goodness
i bought the cheapest one from namecheap

i then used https://decoder.link/csr_generator to gererate a CSR because i'm not actually hosting a website anywhere yet (and usually a CSR is generated on the machine that is HOSTING something)

# See also
[[Migadu]]
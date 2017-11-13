Thunderbird
===========

## Archive

* Add a `.gitignore` file into your profile directory

Let's suppose you've never added the profile directory before.

* `git add` the profile directory:

```bash
cd ~/.config/thunderbird
dot add default
```

* List all the new staged file and archive them:

```bash
zip -9 profile.zip $(dot status -s -b | grep -E '^A' | cut -c 4-)
```

* Remove new staged file from changes:

```bash
dot reset
```

## Encrypt

* Convert your public key in `.pem` format:

```bash
openssl rsa -in ~/.ssh/id_rsa -pubout -outform pem > id_rsa.pub.pem
Enter pass phrase for /home/user/.ssh/id_rsa:
writing RSA key
```

* Generate a key file:

```bash
openssl rand -base64 256 > key.bin
```

* Encrypt that key with your public key:

```bash
openssl rsautl -encrypt -inkey id_rsa.pub.pem -pubin -in key.bin -out key.enc
```

* Use the encrypted key to encrypt your archive:

```bash
openssl enc -aes-256-cbc -salt               \
        -in profile.zip -out profile.zip.enc \
        -pass file:./key.bin
```

* Do not forget to commit/push the encrypted key

## Decrypt

* Decrypt the key with your public key:

```bash
openssl rsautl -decrypt -inkey id_rsa.pub.pem -pubin -in key.enc -out key.bin
```

* Use the key to decrypt your archive:

```bash
openssl enc -d -aes-256-cbc \
        -in profile.zip.enc -out profile.zip \
        -pass file:./key.bin
```

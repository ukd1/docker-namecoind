# Docker namecoind

First create a salted hashed password to use to connect from `namecoin-cli`.

```bash
wget https://raw.githubusercontent.com/namecoin/namecoin-core/master/share/rpcuser/rpcuser.py
python rpcuser.py $USER
```

Then

```
docker run -d --restart always --name namecoind -p 127.0.0.1:8336:8336 -p 8334:8334 -v `pwd`/data:/data ukd1/namecoind -env NAMECOIND_RPCAUTH=${HASH_FROM_ABOVE}
```

or run on docker cloud, making sure to set ``NAMECOIND_RPCAUTH`` to your hash from above.

# Docker namecoind

First create a salted hashed password to use to connect from `namecoin-cli`.

    wget https://raw.githubusercontent.com/namecoin/namecoin-core/master/share/rpcuser/rpcuser.py
    python rpcuser.py $USER

Then

    docker run -d --restart always --name namecoind -p 127.0.0.1:8336:8336 -p 8334:8334 -v `pwd`/data:/data ziis/namecoind '-rpcauth=${HASH_FROM_ABOVE}'

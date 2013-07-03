irc-notify
===========================

Send a message to an IRC channel


Example
--------

```
    - wouter/irc-notify:
        server: irc.freenode.net
        port: 6667
        message: $WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME build by $WERCKER_STARTED_BY finished
        nickname: nick
        channel: chan

```
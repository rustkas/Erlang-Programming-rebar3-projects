ex01_linked_ping_pong_server
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell

```
Pid = linked_ping_pong_server:go().
true
ok
linked_ping_pong_server:stop().
is_process_alive(Pid).
```
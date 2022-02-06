ex02_mutex_version_1
=====
```
rebar3 new lib ex02_mutex_version_1 && cd ex02_mutex_version_1 && rm -R src && mkdir lib && cd lib && rebar3 new lib mutex && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell

```
mutex:start().
exit(ok).
```

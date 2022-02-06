ex04_break_proc
=====
```
rebar3 new lib ex04_break_proc && cd ex04_break_proc && rm -R src && mkdir lib && cd lib && rebar3 new lib break_proc && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile
    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing. Sometimes is not helpping. Just restart.	

```
1> process_flag(trap_exit, true).
false
2> break_proc:exit_proc_link().
{true,<0.198.0>}
3> receive Result -> Result end.
{'EXIT',<0.198.0>,ok}
4> is_process_alive(list_to_pid("<0.198.0>")).
false
```

```
1> process_flag(trap_exit, true).
false
2> self().
<0.135.0>
2> break_proc:exit_atom_proc_link().
<0.139.0>
3> receive Result -> Result end.
{'EXIT',<0.139.0>,ok}
4> is_process_alive(list_to_pid("<0.139.0>")).
false
5> self().
<0.135.0>
```

```
1> process_flag(trap_exit, true).
false
2> break_proc:exit_proc_link2().
{true,<0.198.0>}
3> receive Result -> Result end.
{'EXIT',<0.198.0>,ok}
4> is_process_alive(list_to_pid("<0.198.0>")).
false
```

break_proc:exit_proc_monitor
==========
```
1> process_flag(trap_exit, true).
false
2> {Ref, Pid} = break_proc:exit_proc_monitor().
Function has run = true
{#Ref<0.856990544.3171418113.147869>,<0.138.0>}
3> receive Result -> Result end.
{'DOWN',#Ref<0.856990544.3171418113.147869>,process,<0.138.0>,ok}
4> is_process_alive(Pid).
false
5> erlang:demonitor(Ref,[flush]).
true
```
exit_proc_monitor2
==========
```
1> process_flag(trap_exit, true).
false
2> {Ref, Pid} = break_proc:exit_proc_monitor2().
Function has run = true
{#Ref<0.3425503224.757071873.38156>,<0.138.0>}
3> receive Result -> Result end.
{'DOWN',#Ref<0.3425503224.757071873.38156>,process,<0.138.0>,ok}
4> is_process_alive(Pid).
false
5> erlang:demonitor(Ref,[flush]).
true
```

```
exit_ok:start().
exit_ok:normal_exit_1().

exit_ok:start().
exit_ok:normal_exit_2().

exit_ok:normal_start().
exit_ok:normal_exit_1().

exit_ok:normal_start().
exit_ok:normal_exit_2().

exit_ok:normal_start().
exit_ok:unnormal_exit_1().

exit_ok:normal_start().
exit_ok:kill_exit_01().
** exception exit: kill

exit_ok:start().
exit_ok:kill_exit_01().
Error. Pid = <0.143.0>. Reason = kill

exit_ok:start().
exit_ok:kill_exit_02().
```


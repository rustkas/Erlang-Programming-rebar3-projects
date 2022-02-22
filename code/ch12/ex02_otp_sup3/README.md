ex02_otp_sup3
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	
```
1> usr_sup:start_link().
{ok,<0.137.0>}
2> whereis(usr).
<0.138.0>
3> exit(whereis(usr), kill).
=SUPERVISOR REPORT==== 21-Feb-2022::10:58:57.432000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.138.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,temporary},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]
true
4> exit(whereis(usr), kill).
=ERROR REPORT==== 21-Feb-2022::10:59:23.715000 ===
** Generic server usr_sup terminating
** Last message in was {'EXIT',<0.135.0>,
                        {badarg,
                         [{erlang,exit,
                           [undefined,kill],
                           [{error_info,#{module => erl_erts_errors}}]},
                          {erl_eval,do_apply,6,
                           [{file,"erl_eval.erl"},{line,689}]},
                          {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
                          {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
                          {shell,eval_loop,3,
                           [{file,"shell.erl"},{line,627}]}]}}
** When Server state == {state,{local,usr_sup},
                               one_for_all,
                               {[],#{}},
                               undefined,1,1,[],0,never,usr_sup,[]}
** Reason for termination ==
** {badarg,[{erlang,exit,
                    [undefined,kill],
                    [{error_info,#{module => erl_erts_errors}}]},
            {erl_eval,do_apply,6,[{file,"erl_eval.erl"},{line,689}]},
            {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
            {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
            {shell,eval_loop,3,[{file,"shell.erl"},{line,627}]}]}

=CRASH REPORT==== 21-Feb-2022::10:59:23.715000 ===
  crasher:
    initial call: supervisor:usr_sup/1
    pid: <0.137.0>
    registered_name: usr_sup
    exception exit: {badarg,
                        [{erlang,exit,
                             [undefined,kill],
                             [{error_info,#{module => erl_erts_errors}}]},
                         {erl_eval,do_apply,6,
                             [{file,"erl_eval.erl"},{line,689}]},
                         {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
                         {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
                         {shell,eval_loop,3,[{file,"shell.erl"},{line,627}]}]}
      in function  gen_server:decode_msg/9 (gen_server.erl, line 481)
    ancestors: [<0.135.0>]
    message_queue_len: 1
    messages: [{'EXIT',<0.135.0>,normal}]
    links: []
    dictionary: []
    trap_exit: true
    status: running
    heap_size: 6772
    stack_size: 29
    reductions: 13581
  neighbours:

** exception error: bad argument
     in function  exit/2
        called as exit(undefined,kill)
        *** argument 1: not a pid
5>
```

Use gen_server functionality
```
1> usr_sup:start_link().
{ok,<0.137.0>}
2> rr("lib/otp_sup/src/usr.hrl").
[usr]
3> usr:add_usr(700000000, 0, prepay).
ok
4> usr:set_service(0, data, true).
ok
5> usr:lookup_id(0).
{ok,#usr{msisdn = 700000000,id = 0,status = enabled,
         plan = prepay,
         services = [data]}}
6> usr:service_flag(700000000,lbs).
false
7> whereis(usr).
<0.138.0>
8> usr:lookup_id(0).
{ok,#usr{msisdn = 700000000,id = 0,status = enabled,
         plan = prepay,
         services = [data]}}
9> exit(whereis(usr), kill).
=SUPERVISOR REPORT==== 21-Feb-2022::13:54:38.441000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.138.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,temporary},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]

true
10> exit(whereis(usr), kill).
=ERROR REPORT==== 21-Feb-2022::13:55:21.329000 ===
** Generic server usr_sup terminating
** Last message in was {'EXIT',<0.135.0>,
                        {badarg,
                         [{erlang,exit,
                           [undefined,kill],
                           [{error_info,#{module => erl_erts_errors}}]},
                          {erl_eval,do_apply,6,
                           [{file,"erl_eval.erl"},{line,689}]},
                          {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
                          {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
                          {shell,eval_loop,3,
                           [{file,"shell.erl"},{line,627}]}]}}
** When Server state == {state,{local,usr_sup},
                               one_for_all,
                               {[],#{}},
                               undefined,1,1,[],0,never,usr_sup,[]}
** Reason for termination ==
** {badarg,[{erlang,exit,
                    [undefined,kill],
                    [{error_info,#{module => erl_erts_errors}}]},
            {erl_eval,do_apply,6,[{file,"erl_eval.erl"},{line,689}]},
            {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
            {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
            {shell,eval_loop,3,[{file,"shell.erl"},{line,627}]}]}

=CRASH REPORT==== 21-Feb-2022::13:55:21.330000 ===
  crasher:
    initial call: supervisor:usr_sup/1
    pid: <0.137.0>
    registered_name: usr_sup
    exception exit: {badarg,
                        [{erlang,exit,
                             [undefined,kill],
                             [{error_info,#{module => erl_erts_errors}}]},
                         {erl_eval,do_apply,6,
                             [{file,"erl_eval.erl"},{line,689}]},
                         {shell,exprs,7,[{file,"shell.erl"},{line,686}]},
                         {shell,eval_exprs,7,[{file,"shell.erl"},{line,642}]},
                         {shell,eval_loop,3,[{file,"shell.erl"},{line,627}]}]}
      in function  gen_server:decode_msg/9 (gen_server.erl, line 481)
    ancestors: [<0.135.0>]
    message_queue_len: 1
    messages: [{'EXIT',<0.135.0>,normal}]
    links: []
    dictionary: []
    trap_exit: true
    status: running
    heap_size: 6772
    stack_size: 29
    reductions: 13581
  neighbours:

** exception error: bad argument
     in function  exit/2
        called as exit(undefined,kill)
        *** argument 1: not a pid
11>
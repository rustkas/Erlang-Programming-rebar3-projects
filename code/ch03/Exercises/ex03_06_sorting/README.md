ex03_06_sorting
=====

Exercise 3-6: Sorting Lists
=====

Implement the following sort algorithms over lists:

Quicksort

The head of the list is taken as the pivot; the list is then split according to those
elements smaller than the pivot and the rest. These two lists are then recursively
sorted by quicksort, and joined together, with the pivot between them.

Merge sort

The list is split into two lists of (almost) equal length. 
These are then sorted separately and their results merged in order.

## An OTP application

Create new project

---- 
 # all commands in one string
 $ rebar3 new umbrella ex03_06_sorting && cd ex03_06_sorting && rm -R apps && mkdir lib && cd lib && rebar3 new lib quicksort && rebar3 new lib mergedsort && cd ..
 
Run shell
-----

 $ rebar3 shell
 > r3:do(compile). % recompile after source code editing 

```

```

### Run EUnit

-----
 $ rebar3 eunit -m quicksort_test
 $ rebar3 eunit -m quicksort_test -v

 $ rebar3 eunit -m mergedsort_test
 $ rebar3 eunit -m mergedsort_test -v 

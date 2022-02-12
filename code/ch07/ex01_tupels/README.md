ex01_tupels
=====
```
rebar3 new lib ex01_tupels && cd ex01_tupels && rm -R src && mkdir lib && cd lib && rebar3 new lib tupels && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	
```
tuples1:test1().

tuples1:test2().
```	

-record(person, {name,age,phone}).
```
1> rd(person, {name,age,phone}).
person

2> #person{name="Joe", age=21, phone="999-999"}.
#person{name="Joe", age=21, phone="999-999"}
3> #person{phone="999-999", name="Joe", age=21}.
#person{name="Joe", age=21, phone="999-999"}
4> rd(person, {name,age=0,phone=""}).
person
5> #person{name="Fred"}.
#person{name = "Fred",age = 0,phone = []}
6> #person{}.
#person{name = undefined,age = 0,phone = []}
7> Person = #person{name="Fred"}.
#person{name = "Fred",age = 0,phone = []}
8> Person#person.name.
"Fred"
9> NewPerson = Person#person{age=37}.
#person{name = "Fred",age = 37,phone = []}
10> f(NewPerson).
ok
11> NewPerson = Person#person{phone="999-999",age=37}.
#person{name = "Fred",age = 37,phone = "999-999"}
```

```
1> rd(person, {name,age,phone}).
person
2> Person = #person{name="Fred"}.
#person{name = "Fred",age = undefined,phone = undefined}
3> NewPerson = Person#person{phone="999-999",age=37}.
#person{name = "Fred",age = 37,phone = "999-999"}
4> records:birthday1(NewPerson).
#person{name = "Fred",age = 38,phone = "999-999"}
4> records:birthday2(NewPerson).
#person{name = "Fred",age = 38,phone = "999-999"}
```

```
1> rd(person, {name,age,phone}).
person
2> records1:test1().
name: "Joe"  age: 21  phone: "999-999"
ok
3> records1:test2().
name: "Joe"  age: 22  phone: "999-999"
ok
```

```
1> rl().
ok
2> rd(person, {name,age,phone}).
person
2> rd(name, {first, surname}).
name
3> P = #person{name = #name{first = "Robert", surname = "Virding"},age = 37, phone = "999-999"}.
#person{name = #name{first = "Robert",surname = "Virding"}, age = 37,phone = "999-999"}
4> First = (P#person.name)#name.first.
"Robert"
```

```
1> rr(records).
[name,person]
2> Person = #person{name="Mike",age=30}.
#person{name = "Mike",age = 30,phone = undefined}
3> Person#person.age + 1.
31
5> NewPerson = Person#person{phone=5697}.
#person{name = "Mike",age = 30,phone = 5697}
6> NewPerson = Person#person{name=#name{first="Mike",surname="Williams"}}.
#person{name = #name{first = "Mike",surname = "Williams"},
age = 30,phone = undefined}
7> FirstName = (NewPerson#person.name)#name.first.
"Mike"
8> Person = Person#person{name=#name{first="Chris",surname="Williams"}}.
** exception error: no match of right hand side value
#person{name = #name{first = "Mike",surname = "Williams"},
age = 30,phone = undefined}
```

```
1> rr(records).
[person]
11> records1:joe().
#person{name = "Joe",age = 21,phone = "999-999"}
12> records1:joe() == {person,"Joe",21,"999-999"}.
true
13> Tuple = {name,"Francesco","Cesarini"}.
#name{first = "Francesco",surname = "Cesarini"}
14> rd(name, {first, surname}).
15> Tuple#name.first.
"Francesco"
16> Tuple#name{} =:= {name,"Francesco", "Cesarini"}.
true
17> #person.name.
2
18> record_info(size, person).
4
19>is_record(Tuple,name).
 true
```
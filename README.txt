Add to the beginning to eagle.scr:

assign c+d 'run copy'
assign c+f 'run paste'
assign a+c 'run copy'
assign a+v 'run paste'

Restrictions
============

* schematic and board must be consistent.
* Errors in ERC can lead to questions on paste.
* There must be a connection between two symbols if they touch each other.

* Names must not contain '
* Only up to 999 schematic pages are supported (which is equivalent to the limit
  of Eagle 5.3 Professional).
* Attributes won't be copied (ul_part, ul_element).

Notice to programming style / Limits of the User Language
=========================================================

* Arrays are not allowed as parameter. Workaround: One function for each array.

What I want to write:

int foo[];
int bar[];

int inc(int *list, int index) {
	list[index]++;
}

inc(foo, 42);
inc(bar, 21);

Workaround:

int foo[];
int bar[];

int foo_inc(int index) {
	foo[index]++;
}

int bar_inc(int index) {
	bar[index]++;
}

foo_inc(42);
bar_inc(21);

* No structures. Workaround: Use a prefix for each element of the structure.

What I want to write:

typedef struct {
	int foo;
	int bar;
} example_structure;

example_structure foobar;

foobar.foo = 42;
foobar.bar = foobar.foo / 2;

Workaround:

int es_foo;
int es_bar;

es_foo = 42;
es_bar = es_foo / 2;

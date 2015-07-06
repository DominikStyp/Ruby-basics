## Most important features of the **PRY** (Ruby Interactive Shell replacement)

### Installation
```shell
	gem install pry
	pry
```

### How to use fast tutorials
<a href="https://vimeo.com/26391171">Pry Screencast video by Joshua Cheek</a>

### Inspecting class methods
Let's say I want to inspect **String** class and search for method that can match substring. <br />
First I need to *dive* into **String** class typing:
```shell
pry(main)> cd String
```
Now let's list methods:
```shell
pry(String):1> ls -m
```
It should print something like:
```
 %    []           capitalize!  chr         downcase        encode          gsub      intern   next!      rindex      setbyte      squeeze      succ!      to_s               unicode_normalize!
 *    []=          casecmp      clear       downcase!       encode!         gsub!     length   oct        rjust       shell_split  squeeze!     sum        to_str             unicode_normalized?
 +    ascii_only?  center       codepoints  dump            encoding        hash      lines    ord        rpartition  shellescape  start_with?  swapcase   to_sym             unpack
 <<   b            chars        concat      each_byte       end_with?       hex       ljust    partition  rstrip      shellsplit   strip        swapcase!  tr                 upcase
 <=>  bytes        chomp        count       each_char       eql?            include?  lstrip   prepend    rstrip!     size         strip!       to_c       tr!                upcase!
 ==   bytesize     chomp!       crypt       each_codepoint  force_encoding  index     lstrip!  replace    scan        slice        sub          to_f       tr_s               upto
 ===  byteslice    chop         delete      each_line       freeze          insert    match    reverse    scrub       slice!       sub!         to_i       tr_s!              valid_encoding?
 =~   capitalize   chop!        delete!     empty?          getbyte         inspect   next     reverse!   scrub!      split        succ         to_r       unicode_normalize
```
As we can see there is **match** method in the output.<br />
But we can also filter the output using **-G** flag as follows: <br />
```shell
pry(String):1> ls -G match
```
Which outputs <br />
```shell
String#methods: match
```
So let's see the **documentation** for that method:<br />
```shell
pry(String):1> show-doc match
```
This should output: <br />
```
From: string.c (C Method):
Owner: String
Visibility: public
Signature: match(*arg1)
Number of lines: 22

Converts pattern to a Regexp (if it isn't already one),
then invokes its match method on str.  If the second
parameter is present, it specifies the position in the string to begin the
search.

   'hello'.match('(.)\1')      #=> #<MatchData "ll" 1:"l">
   'hello'.match('(.)\1')[0]   #=> "ll"
   'hello'.match(/(.)\1/)[0]   #=> "ll"
   'hello'.match('xx')         #=> nil

If a block is given, invoke the block with MatchData if match succeed, so
that you can write

   str.match(pat) {|m| ...}

instead of

   if m = str.match(pat)
     ...
   end
```
What other options do we have using **ls** command ?<br />
We can see that typing: **ls -h**: <br />
```shell

    -m, --methods               Show public methods defined on the Object
    -M, --instance-methods      Show public methods defined in a Module or Class
    -p, --ppp                   Show public, protected (in yellow) and private (in green) methods
    -q, --quiet                 Show only methods defined on object.singleton_class and object.class
    -v, --verbose               Show methods and constants on all super-classes (ignores Pry.config.ls.ceiling)
    -g, --globals               Show global variables, including those builtin to Ruby (in cyan)
    -l, --locals                Show hash of local vars, sorted by descending size
    -c, --constants             Show constants, highlighting classes (in blue), and exceptions (in purple).
                                Constants that are pending autoload? are also shown (in yellow)
    -i, --ivars                 Show instance variables (in blue) and class variables (in bright blue)
    -G, --grep                  Filter output by regular expression
    -h, --help                  Show this message.
```

How to **show specified method's code** ? <br />
```shell
[19] pry(String):1> show-method match
```
Which outputs <br />
```ruby
From: string.c (C Method):
Owner: String
Visibility: public
Number of lines: 14

static VALUE
rb_str_match_m(int argc, VALUE *argv, VALUE str)
{
    VALUE re, result;
    if (argc < 1)
        rb_check_arity(argc, 1, 2);
    re = argv[0];
    argv[0] = str;
    result = rb_funcall2(get_pat(re), rb_intern("match"), argc, argv);
    if (!NIL_P(result) && rb_block_given_p()) {
        return rb_yield(result);
    }
    return result;
}
```

How to show nested objects tree which you've went through, and jump to specified level ? <br />
```shell
[23] pry(main)> cd String
[24] pry(String):1> cd Integer
[25] pry(Integer):2> cd Float
[26] pry(Float):3> nesting
Nesting status:
--
0. main (Pry top level)
1. String
2. Integer
3. Float
[28] pry(Float):3> jump-to 1
[29] pry(String):1>
```

How to correct mistakes during code writing in the PRY console ? <br />
First example shows how to clear the buffer and start again by typing **!**
```shell
[33] pry(main)> def wronglyTped()
[33] pry(main)*   fuck mistype again
[33] pry(main)*   !
Input buffer cleared!
```
Second example shows how to correct certain line that has a mistake.<br />
In this example I'll use **show-input** to show code that was typed already, <br />
and **amend-line** [LINE NUMBER] [NEW LINE DEFINITION] to change the line: <br />  
```shell
[40] pry(main)> def wrnglyTyped()
[40] pry(main)*   x = 10
[40] pry(main)*   puts "mistyped again!"
[40] pry(main)*   show-input
1: def wrnglyTyped()
2:   x = 10
3:   puts "mistyped again!"
[40] pry(main)*   amend-line 1 def nicelyTyped()
1: def nicelyTyped()
2:   x = 10
3:   puts "mistyped again!"
[40] pry(main)*   end
=> :nicelyTyped
[41] pry(main)> nicelyTyped
mistyped again!
=> nil

```

Getting out of the certain class scope is just like navigating the path in a shell:

```shell
[19] pry(String):1> cd ..
[20] pry(main)>
```

To invoke system commands from **pry shell** you just need to add **.** before every command. <br />
Remember that you can use only commands from your current operating system. <br />
```shell
[51] pry(main)> .ls
```
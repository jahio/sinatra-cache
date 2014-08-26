# varnish_frontend

This recipe is a little bit of a hack. A few caveats:

+ As of the date of this writing (August 26, 2014), Engine Yard does not yet have
a valid ebuild for Varnish 4.0.1 (latest as of now) in our portage tree. Yes, Professional
Services has made as much noise as we can to the relevant parties. Can't say when they'll
get their proverbial "rears" in gear, though.
+ For some as-yet unknown reason, building from source fails on Gentoo. The specific error
cites a bug from C about the "param" char variable. It's weird - even the Varnish guys in
IRC hadn't seen that one before. Building from the master branch in their repo got past it,
but 'make check', which performs tests, failed with 41 test failures at this point in time.
You wouldn't want to take off on a plane with 41 failing pre-flight checks, would you?
+ Because of the above shitstorm, we're using 3.0.5-r1. Yep, release 1. Best that's in portage. Sorry
folks. I'm just as irate about it as you are.
+ There was an earlier version of this recipe that I've made changes to. That version used
iptables to intercept incoming traffic from outside the network and force it into varnish,
then back to port 80 (where either haproxy or nginx is going to be listening, depending
on environment type). This was to get around issues with the stack forcing haproxy on
port 80 no matter what. That part's still in there to make upgrades and such smoother.
I don't personally *like* it, but it's about our best option in a time crunch (< 24 hours
to get this working. Thanks, sales.)


## Routing works a lil' something like this:

```
browser -> (internet) -> [vm:80] -> IPTABLES!!!! -> [varnish:882] -> IPTABLES!!!! -> [haproxy/nginx:80]
```

## Using it

Clone the repo or just copy the cookbooks directory, whatever you want to do, then follow the standard
EY chef procedures of having the main/recipes/default.rb file in place saying "include_recipe 'varnish_frontend'".
That oughtta do 'er.

## Support?

LOL. No.

# sinatra-cache

This is a very simple, no-frills Ruby app to let you test a front-end cache. Literally all
it does is print to the screen the date/time and TZ of when a page was rendered. So let's
say you want to use Varnish for something and test that it's going to actually keep something
cached for, say, 5 minutes before regenerating it. No problem. Set it up, then hit the URL
with this app once. You should see the current date/time. Wait one minute, then do it again.
**The date and time should NOT change.**

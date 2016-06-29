# Middleman V4 with Contentful Middleman Example

I've come to rely quite heavily on Middleman and Contentful in my workflow. The documentation for the latter assumes a certain technical ability. I'm a desginer by trade, and while I'm decent at the front-end, there was a big learning curve for me on the Middleman/Contentful integration. By now I'm becoming pretty comfortable with it (or at least, a lot better than I was).

This might help other people. It's using Middleman V4 (pretty new at the time of this push), and the beta Contentful Middleman gem.

I prefer Slim (quite a bit) over ERB, so you'll need that gem. Sass or Scss doesn't matter, I prefer the Sass indented syntax, but you can use either or mix and match.

This mainly exists to show you how to do a few key things, but in production, you're obviously going to do a few things differently (such as putting the Contentful info into a .env file).

----

## Other Things of Interest

### Hosting

Netlify is a great webhost and works flawlessly with the contentful_middleman gem. Essentially, you can tell it to rebuild every time you push a new version to Github or your client adds new content.

### Other Options

The contentful_middleman gem is great for a lot of reasons (including being able to produce dynamic pages like you'd want in a blog). If you just need minor snippets of content though (and you're not doing new dynamicallly created pages), you might want to import Contentful data via Angular. It's a 10-15 second wait before you see new content vs the 1-5 minutes it takes Netlify to push a new build.

### Potential Issues
You might have trouble with the bundle install, specifically with eventmachine, [this](https://github.com/eventmachine/eventmachine/issues/643) might help.

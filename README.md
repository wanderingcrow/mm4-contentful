# Middleman V4 with Contentful Middleman Example
I've come to rely quite heavily on Middleman and Contentful in my workflow. The documentation for the latter assumes a certain technical ability. I'm a desginer by trade, and while I'm decent at the front-end, there was a big learning curve for me on the Middleman/Contentful integration. By now I'm becoming pretty comfortable with it (or at least, a lot better than I was).

This might help other people. It's using Middleman V4 and the beta Contentful Middleman gem.

I prefer Slim (quite a bit) over ERB, so you'll need that gem. Sass or Scss doesn't matter, I prefer the Sass indented syntax, but you can use either or mix and match.

----

## Install
1. `bundle install`
1. create a `.env` file at the root and use something like this: `CONTENTFUL_TOKEN=your-token-here`
1. In the `config.rb` file, change your space and content types.
1. `middleman contentful`
1. `middleman server`

----

## Demo Site and Repo
- [Demo Site](http://mm-contentful-example.netlify.com/)
- [Public Repo](https://github.com/javaporter/mm4-contentful)

I'm still learning and I'm certainly not doing everything as clean as possible, if you want to improve on this, please feel free to fork and request a pull request.

----

## Other Things of Interest
### Hosting
Netlify is a great webhost and works flawlessly with the contentful_middleman gem. Essentially, you can tell it to rebuild every time you push a new version to Github or your client adds new content. Please note, Netlify handles a lot of the [performance stuff](https://www.netlify.com/features) already, including compression, so if you're using them as a host, you don't need to sweat that stuff a whole lot.

### Other Options
The contentful_middleman gem is great for a lot of reasons (including being able to produce dynamic pages like you'd want in a blog). If you just need minor snippets of content though (and you're not doing new dynamicallly created pages), you might want to import Contentful data via Angular. It's a 10-15 second wait before you see new content vs the 1-5 minutes it takes Netlify to push a new build.

### dotenv and preview API
By design, dotenv can't have a value of 'false'. So in the config file I put this:
```Ruby
if f.use_preview_api = 'true'
  f.use_preview_api = ENV['PREVIEW_TOGGLE']
end
```

So, if you want a Netlify server or dev setup that shows your 'drafts' in Contentful, you simply do an ENV in .env that defines this as true (e.g. `PREVIEW_TOGGLE=true`), otherwise, don't do anything. Tested and working version [here](http://mm-contentful-preview.netlify.com/).

### Potential Issues
You might have trouble with the bundle install, specifically with eventmachine, [this](https://github.com/eventmachine/eventmachine/issues/643) might help.

### Ignore Your Data Folder
I don't like having new data junk up my git commits, also don't like having the lack of data bork MM. If you're going to want this to run independant of an existing data folder, you'll like this little snippet: `if Dir.exist?(config.data_dir)`

### Alias Stuff
I'm lazy. In my .bash_profile I alias a few things that I use all the time:

```sh
alias mm='bundle exec middleman server'
alias mm-build='bundle exec middleman build'
alias mm-content='bundle exec middleman contentful'
```

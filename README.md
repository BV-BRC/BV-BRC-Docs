# BV-BRC Documentation Repo

This repository is for manage BV-BRC static contents such as Website Tutorial, CLI Tutorial, User Guides, and BV-BRC eNews. 
See [here](./Setup.md) for configuration.

## Nginx
After following the Sphinx/Nginx [Setup Guide](./Setup.md) make sure your local Nginx server is running.
```
sudo nginx
```
And enter your password. You'll need to turn this on everytime you restart your computer unless you have it set to start automatically.

## How to add an entry
1. Create a folder. If you don't have image associated, then you can ommit the images folder.
```
mkdir -p tutorial/excel_formatting/images/
```

2. Make a markdown or ReST (ReStructuredText) format file

3. Place images under `./images` sub folder

4. If you have a file attachment to link, place the file in the '_static' directory, and reference it from there. (Sphinx will ignore attachment files such as .PDF, .XLSX, etc)

5. Add a link in the category index file (e.g. `tutorial/index.rst`)

6. build html
```
$ make html
```

Note: You may need to completely clear your previously built docs application to see new changes made. You can run this command to delete and rebuild from within the docroot directory.
```
rm -rf _build && make html
```

## How to add a News entry
In order to generate feed RSS, you need to write the news entries in rst format.
Check a sample entry [here](https://github.com/PATRIC3/p3_docs/blob/master/docroot/news/20170930-patric-september-2017-data-release.rst)

1. Follow the instruction for creating a file & linking
2. For news entries, you need to add a code block like below,
```
.. feed-entry::
   :date: 2017-09-30

   Add description (a line or two) regarding the news item here. This will show up in the home page.

.. cut::
```

3. When you build html, `news.rss` will be updated.

## Resources
We write our documentation pages in both Markdown (.md) and reStructuredText (.rst). Sphinx uses the CommonMark version of Markdown when it builds the documentation site. It is slightly different than the GitHub Flavored MarkDown used by GitHub so make sure to take note of any subtle differences. Use these resources to write and develop documentation for PATRIC without causing warnings or failures. There is only one flavor of reStructuredText.

### Markdown

- [CommonMark](https://commonmark.org/)
- [CommonMark Reference](https://commonmark.org/)
- [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)
- [GitHub Markdown Cheat Sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [GitHub Mastering Markdown Guide](https://guides.github.com/features/mastering-markdown/)

### reStructuredText

- [reStructuredText](http://docutils.sourceforge.net/rst.html)
- [reStructuredText Markup Specification](http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html)
- [reStructuredText Quick Reference](http://docutils.sourceforge.net/docs/user/rst/quickref.html)

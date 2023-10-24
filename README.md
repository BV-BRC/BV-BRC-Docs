# The BV-BRC Documentation Site

## System Requirements

The documentation website requires [Python](https://www.python.org/) with [PIP](https://pypi.org/project/pip/) and [Nginx](https://nginx.org/en/) to be installed and configured on your machine. Modern versions of both should work.

If using **MacOS** all can be installed with [Homebrew](https://brew.sh/)

## Sphinx
```
pip install Sphinx
```
### Install Markdown support
```
pip install recommonmark
```
See more detail http://www.sphinx-doc.org/en/stable/markdown.html

### Install readthedocs theme
```
pip install sphinx_rtd_theme
```
See more detail https://github.com/rtfd/sphinx_rtd_theme

### Install additional plugins
```
pip install sphinxcontrib-newsfeed
pip install sphinxcontrib-spelling
```

## Nginx
Install nginx and config like below. Set document root accordingly.

```
# nginx conf

server {
	listen 80;
	server_name docs.bvbrc.local;
	root /BV-BRC-Docs/docroot/_build/html;

        # to avoid Cross-Origin Request Blocked error
        location / { 
          if ($request_method = 'OPTIONS') {
             add_header 'Access-Control-Allow-Origin' '*';
             add_header 'Access-Control-Allow-Methods' 'GET, OPTIONS';
             add_header 'Access-Control-Allow-Headers' 'Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
             return 204;
          }
          if ($request_method = 'GET') {
             add_header 'Access-Control-Allow-Origin' '*';
             add_header 'Access-Control-Allow-Methods' 'GET, OPTIONS';
          }
        }
}
```

Add record for docs.bvbrc.local in /etc/hosts with sudo
```
127.0.0.1	localhost
127.0.0.1	docs.bvbrc.local
```

## How to add an entry, page, tutorial, or guide
Following the structure already laid out in the repository you should be able to create a .md or .rst file corresponding to what you're looking to do. In order for it to show up in the Table of Contents or landing pages make sure to link your new page to the respective `index.rst` located at it's corresponding spot in the heirarchy.

## Rebuild the documentation
From within the `BV-BRC-Docs/docroot` directory you can run this command to rebuild the doc site.
```
make html
```

On occastion, especially with heavy TOC changes and/or static files added you make need to do a complete rebuild.
```
rm -rf _build && make html
```

## Sphinx Container
We have created a singularity container containing all of the sphinx dependencies as well as an appropriately configured nginx server for hosting the documentation for local development/updates.  There are two applications within the singularity container: ```build``` and ```webserver```.  Developers can clone the bv-brc documentation repository and then bind that folder to /doc_repo within the container. 

### To build the docs:
Running this command will do the sphinx build.  Developers should clone the repository first and then include it in the --bind parameter below.
```
singularity run --app build --bind /path/to/clone/of/BV-BRC-Docs:/doc_repo /path/to/singularity/image/sphinx.sif
```
After the build is completed, it is still the developers responsiblity to commit their changes to the doc repo.

### Hosting the docs for development
Once the documentation has been rebuilt, the webserver can be launched to allow review of the documentation:
```
singularity run --app webserver --writable-tmpfs  --bind /path/to/clone/of/BV-BRC-Docs:/doc_repo /path/to/singularity/image/sphinx.sif <PORT TO LISTEN ON, Defaults to 8080>
```

## Resources
We write our documentation pages in both Markdown (.md) and reStructuredText (.rst). Sphinx uses the CommonMark version of Markdown when it builds the documentation site. It is slightly different than the GitHub Flavored MarkDown used by GitHub so make sure to take note of any subtle differences. Use these resources to write and develop documentation for BV-BRC without causing warnings or failures. There is only one flavor of reStructuredText.

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

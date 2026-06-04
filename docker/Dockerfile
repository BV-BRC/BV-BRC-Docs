# Dockerfile for building the BV-BRC documentation site with Sphinx.
#
# This mirrors the build pipeline in ../singularity/build.def so the
# generated HTML matches what's deployed to docs.bv-brc.org. The Python /
# Sphinx / parser versions are kept in sync with that recipe; update both
# when changing.
#
# Build:
#   docker build -t bvbrc-docs-sphinx -f docker/Dockerfile .
#
# Use (build the docs):
#   docker run --rm -v "$(pwd):/doc_repo" -w /doc_repo/docroot \
#     bvbrc-docs-sphinx make html
#
# Output lands in docroot/_build/html/.
#
# Use (clean rebuild):
#   docker run --rm -v "$(pwd):/doc_repo" -w /doc_repo/docroot \
#     bvbrc-docs-sphinx make clean html

FROM python:3.11.5-slim-bookworm

# OS packages required by sphinxcontrib-spelling (libenchant) and the
# make-based build orchestration. apt-get install with --no-install-recommends
# to keep the image lean.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        make \
        libenchant-2-2 \
    && rm -rf /var/lib/apt/lists/*

# Sphinx + both Markdown parsers (myst-parser is the active path per
# docroot/conf.py; recommonmark stays installed for legacy pages that may
# still use it) + theme + the contribs the config enables.
RUN pip install --no-cache-dir \
        Sphinx==5.3.0 \
        myst-parser \
        recommonmark \
        sphinx_rtd_theme \
        sphinxcontrib-newsfeed \
        sphinxcontrib-spelling \
        sphinxcontrib.httpdomain

# The image expects the docs repo to be mounted at /doc_repo and the
# working directory to be /doc_repo/docroot. `make html` is the default
# build command; override at the docker run invocation if needed.
WORKDIR /doc_repo/docroot
CMD ["make", "html"]

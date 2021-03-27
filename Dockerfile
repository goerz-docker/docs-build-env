FROM ubuntu:20.04 AS base

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential bash bzr curl doxygen g++ ghostscript git git-core gnupg graphviz graphviz-dev imagemagick libbz2-dev libcairo2-dev libenchant1c2a libevent-dev libffi-dev libfreetype6 libfreetype6-dev libgraphviz-dev libjpeg-dev libjpeg8-dev liblcms2-dev liblzma-dev libmysqlclient-dev libncurses5-dev libncursesw5-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev libtiff5-dev libwebp-dev libxml2-dev libxslt-dev libxslt1-dev llvm make mercurial pandoc pkg-config postgresql-client python-openssl subversion tar tk-dev wget xz-utils zlib1g-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip python-is-python3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-luatex dvipng
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN echo "\nmain_memory = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
 && echo "\nextra_mem_bot = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
 && echo "\nfont_mem_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
 && echo "\npool_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
 && echo "\nbuf_size = 12000000" >> /etc/texmf/texmf.d/00debian.cnf \
 && update-texmf \
 && texhash \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && luaotfload-tool --update
RUN python -m pip install twine wheel tox ipython "pygments<3,>=2.5.1" sphinx sphinx_rtd_theme 

FROM base as scientific
RUN python -m pip install pytest jupyter gitpython numpy scipy matplotlib sympy qutip

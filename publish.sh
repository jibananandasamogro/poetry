# install the plugins and build the static site
gitbook install && gitbook build

rm ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.pdf

rm ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.epub

rm ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.mobi
# Generate a PDF file
gitbook pdf ./ ./ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.pdf

# Generate an ePub file
gitbook epub ./ ./ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.epub

# Generate a Mobi file
gitbook mobi ./ ./ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.mobi

cp -Rvf ebooks _book
# checkout to the gh-pages branch
git checkout master

# pull the latest updates
git pull origin master --rebase

# copy the static site files into the current directory.
# cp -Rvf _book/* .
# rsync -av --progress _book . --exclude styles

cp favicon.ico gitbook/images
cp apple-touch-icon-precomposed-152.png gitbook/images
# remove 'node_modules' and '_book' directory
# git clean -fx node_modules
# git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update Book"

# push to the origin
git push -u origin master

# checkout to the master branch
git checkout master

git push origin `git subtree split --prefix _book master`:gh-pages --force
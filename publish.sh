# install the plugins and build the static site
rm _book/জীবনানন্দ-দাশের-কবিতাসমগ্র.pdf

rm _book/জীবনানন্দ-দাশের-কবিতাসমগ্র.epub

rm _book/জীবনানন্দ-দাশের-কবিতাসমগ্র.mobi

gitbook install && gitbook build

rm ebooks/*

# Generate a PDF file
gitbook pdf ./ ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.pdf

# Generate an ePub file
gitbook epub ./ ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.epub

# Generate a Mobi file
gitbook mobi ./ ebooks/জীবনানন্দ-দাশের-কবিতাসমগ্র.mobi


# checkout to the gh-pages branch
git checkout master

# pull the latest updates
git pull origin master --rebase

# copy the static site files into the current directory.
cp -R _book/* .


cp favicon.ico gitbook/images
cp apple-touch-icon-precomposed-152.png gitbook/images
# remove 'node_modules' and '_book' directory
git clean -fx node_modules
git clean -fx _book

# add all files
git add .

# commit
git commit -a -m "Update Book"

# push to the origin
git push -u origin master

# checkout to the master branch
git checkout master 
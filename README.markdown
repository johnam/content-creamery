# Content Creamery

This project is a sample application created to get to know [Google's Material Design](https://material.google.com/) and their [Material Design Lite library](https://getmdl.io/). It is running at [contentcreamery.com](http://www.contentcreamery.com/).

Version 1.x.x of [mdl](https://github.com/google/material-design-lite) has several issues which might make it unusable in production for some. These are noted by the contributors and fixes are expected in v2. 

- Page jumps to the top after mdl elements are upgraded by js
  - A user visits the page, begins reading and scrolling, then is jerked to the top of the page, losing their scroll position
  - The solution implemented here is to use an overlay to prevent scrolling until mdl is done upgrading components. Fade out of the overlay cues the user that the page is done loading.
  - [issues/1224](https://github.com/google/material-design-lite/issues/1224)
  - [issues/1658](https://github.com/google/material-design-lite/issues/1658)


- Scroll position lost when returning to/reloading page
  - Along with the page jumping issue, this is caused by how the layout is structured. An overhaul of how layout is done is in the works for v2 - expect regressions and a period of bug fixes after release.
  - The solution implemented here was suggested in the related github issue - some js to store the scroll position in local storage and set the position when returning to the page.
  - [issues/1120](https://github.com/google/material-design-lite/issues/1120)


- A required field is validated as invalid on page load
  - The solution implemented here is to use a data attribute to mark required fields and add the required property with js after the document is loaded
  - [issues/1502](https://github.com/google/material-design-lite/issues/1502)


- A select element is not included in the library
  - Either implement your own mdl select, or adopt a version that hasn't made it into the library yet
  - [issues/854](https://github.com/google/material-design-lite/issues/854)

A column-based layout for the homepage and an mdl grid for the article pages are set up to ensure that from mobile to desktop the [measure](http://webdesign.tutsplus.com/articles/life-beyond-960px-designing-for-large-screens--webdesign-7348), or width of a line of text, is around 45 to 75 characters for readability. After 1280px the user is free to expand the window width and increase the measure beyond 75 characters if they wish.

This project uses a git [subtree](http://blogs.atlassian.com/2013/05/alternatives-to-git-submodule-git-subtree/) to vendor a gem containing code that would be shared with an admin application. The [vendorize](https://github.com/iainbeeston/vendorise) gem provides "a reusable rake task to vendorise a gem hosted in a private git repo" using subtrees. I use Dropbox to host my private projects free, which can be included in other projects easily with subtrees. If you have collaborators for your Dropbox repos, [git-remote-dropbox](https://github.com/anishathalye/git-remote-dropbox) handles potential consistency/timing issues.
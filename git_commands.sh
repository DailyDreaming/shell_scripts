# because I forget

# squish: https://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git
git reset --soft HEAD~3 && git commit

# add changes to the last commit: https://wikileaks.org/ciav7p1/cms/page_1179773.html
git commit --amend -m 'add some stuff and the other stuff i forgot before'

# port changes to a branch: https://wikileaks.org/ciav7p1/cms/page_1179773.html
git stash
git stash branch new-branch-name

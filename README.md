# Git commit message template

Example
```
  id:765432 feat(login): add password enforcement rules

  Add checks for password enforcement:
    - must be longer than 5 chars
    - must have uppercase letter
    - must have lowercase letter
    - must have number
```

## Installation

### Installer
```
  bash <(curl -s0 https://raw.githubusercontent.com/ElateralLtd/git-commit-template/master/install.sh)
```

### Manual
- git clone `https://github.com/ElateralLtd/git-commit-template.git` ~/elateral/git
- run `git config --global commit.template ~/.git-commit-template.txt`
   - this will use the template whenever `git commit` is called
- run `git config --global commit.cleanup strip`
   - this will prevent git from committing the template
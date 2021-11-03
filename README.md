# xvzf's Dotfiles
> Suited for DevOps & Development (primarily Go, Python), tested on M1(Pro) Macs

My personal MacOS configuration; The idea of using ansible for bootstrappign primarily came from [here](https://github.com/geerlingguy/mac-dev-playbook), handling dotfiles inside of here and not externaly (for ease of use).

## How-to use

1. run `xcode-select --install`
2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
3. Download dependencies using `ansible-galaxy install -r requirements.yml`
4. Run `arch -arm64 ansible-playbook main.yml --ask-become-pass` (first run can take 1-2hrs)

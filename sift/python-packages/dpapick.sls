# Note: not included in init.sls, only required by volatility

include:
  - sift.packages.python-pip
  - sift.packages.python-m2crypto

dpapick:
  pip.installed:
    - name: dpapick
    - upgrade: True
    - install_options: --upgrade-strategy=only-if-needed
    - require:
      - sls: sift.packages.python-pip
      - sls: sift.packages.python-m2crypto

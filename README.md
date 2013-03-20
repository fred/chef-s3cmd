s3cmd Cookbook
==============

This chef cookbook installs the latest s3cmd from the master branch at github.
It downloads the tarball of master: https://github.com/s3tools/s3cmd/archive/master.tar.gz

The latest version of S3CMD from github seems to work better than the old version included in Ubuntu and centos, but be aware it's alpha version and not bug free, don't rely on this version for production servers.

https://github.com/fred/chef-s3cmd


Requirements
------------
  
  This cookbook will install the following packages:

  - python
  - python-setuptools
  - python-distutils-extra


Usage
-----

#### s3cmd::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `s3cmd` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[s3cmd]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors

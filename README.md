Ansible blue-green deployment
=============================

Blue-green deployment for web applications with Ansible.

See Martin Fowler's [BlueGreenDeployment](http://martinfowler.com/bliki/BlueGreenDeployment.html) post for insights.

This role will check whether blue or green should be deployed next and
set the appropriate color in `deploy_color`.

The role uses the last author commit date in blue and green directories,
and sets the deploy color to the directory having the oldest checkout.

This role only solves part of the problem: guessing which one of
blue/green needs to be deployed. The rest (deploying, swapping colors
at the loadbalancer, ...) is left to you.

Requirements
------------

While there are no requirements for this role, your web application
deployment role should be changed to use deploy in a directory specified
by a variable (see Example below).

Role Variables
--------------

`deploy_color`

## Required variables

- `blue_green_directories`: dict containing blue and green application
  directories below `blue` and `breen` keys

## Optional variables

- `verbose`: will display variables set in role; primarily for command
  line usage 

## Variables set in role

- `blue_green_color`: which color has been selected for deploy
- `blue_green_color_directory`: in which directory the application can
  be deployed
- `blue_green_color_parent_directory`: in which directory the
  application can be checked out by the git module

Dependencies
------------

None

Example
-------

  roles:
    - { role: ansible-blue-green, 
        blue_green_directories: { blue: "/srv/www_blue/webapp", 
                                  green: "/srv/www_green/webapp" } }
    - { role: my-webapp,
        my_webapp_home: "{{ blue_green_color_parent_directory }}",
        when: blue_green_color is defined }

Caveats
-------

The color is determined upon commiter date. This information might be
erroneous !

License
-------

BSD

Author Information
------------------

@leucos


# Globality Packer

Builds Ubuntu AMIs using Ansible.
Required Packer version: **>=0.12.0**

## Prerequisites

 1. Install packer:

        brew install packer

 2. Define an AWS user called `packer` with authorization to build a new AMI.

    See `aws/iam_policy.json` for a known, working IAM policy.

 3. Export AWS credentials (e.g. using [awsenv](https://github.com/locationlabs/awsenv)):

        eval $(awsenv packer)

## Usage

 1. Validate:

        packer validate ecs_optimized.json|legacy_web.json

 2. Build:

        packer build ecs_optimized.json|legacy_web.json

 3. **Please note: the image will be made public upon creation.**

## Testing

To test Ansible using Vagrant.

 0. _Only required once per virtualenv_

        mkvirtualenv packer-ubuntu
        pip install -r requirements.txt

    From then on before you want to use Ansible:

        workon packer-ubuntu

 1. Bring up the vagrant instance.

        vagrant up packer-ubuntu

 2. Pull the Ansible Galaxy roles:

        ansible-galaxy install -r requirements.yml -p shared-roles --force

 3. Run Ansible:

    For ECS optimized machines:

        ansible-playbook -i inventory/vagrant packer.yml --skip-tags=legacy

    For Openresty web servers:

        ansible-playbook -i inventory/vagrant packer.yml --skip-tags=ecs

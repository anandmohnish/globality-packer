# Globality Packer

Builds Ubuntu AMIs using Ansible.


## Prerequisites

 1. Install packer:

        brew install packer

 2. Define an AWS user called `packer` with authorization to build a new AMI.

    See `aws/iam_policy.json` for a known, working IAM policy.

 3. Export AWS credentials (e.g. using [awsenv](https://github.com/locationlabs/awsenv)):

        eval $(awsenv packer)

 4. Use our helper script to select the latest offical Ubuntu trusty AMI:
        
        export UBUNTU_VERSION=<version>
        export AWS_SOURCE_AMI=$(./scripts/get_latest_ami_helper.sh)

    _Where `version` is either **`xenial`** (16.04) or **`trusty`** (14.04)_

## Usage

_Note: the order of the concatenated json files is important!_

 1. Validate:

        cat aws/<openresty|docker>.json aws/ebs.json | packer validate -

 2. Build:

        cat aws/<openresty|docker>.json aws/ebs.json | packer build -

 3. If you are happy with the AMI, make it public/visible in the AWS Console
    If not, delete it and its snapshot in the AWS Console


## Testing

To test Ansible using Vagrant.

 0. _Only required once per virtualenv_

        mkvirtualenv packer-<xenial|trusty>
        pip install -r requirements-<xenial|trusty>.txt

    From then on before you want to use Ansible:
    
        workon packer-<xenial|trusty>

 1. Choose an OS version, and bring up the vagrant instance.

        vagrant up packer-ubuntu-<xenial|trusty>

 2. Pull the Ansible Galaxy roles:

        ansible-galaxy install -r requirements.yml -p shared-roles --force

 3. Run Ansible:

        ansible-playbook -i inventory/vagrant packer.yml -l <xenial|trusty>

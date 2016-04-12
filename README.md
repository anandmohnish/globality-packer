# Globality Packer

Builds Ubuntu AMIs using Ansible.


## Prerequisites

 1. Install packer:

        brew install packer

 2. Define an AWS user called `packer` with authorization to build a new AMI.

    See `aws/iam_policy.json` for a known, working IAM policy.

 3. Export AWS credentials (e.g. using [awsenv](https://github.com/locationlabs/awsenv)):

        eval $(awsenv packer)

 4. Choose a source AMI (e.g. from [https://cloud-images.ubuntu.com/locator/ec2](), searching
    for "trusty us-east-1 hvm:ebs-ssd"):

        export AWS_SOURCE_AMI=ami-2b594f41

## Usage

 1. Validate:

        packer validate aws/ebs.json

 2. Build:

        packer build aws/ebs.json

 3. If you are happy with the AMI, make it public/visible in the AWS Console
    If not, delete it and its snapshot in the AWS Console


## Testing

To test Ansible using Vagrant.

 1. Bring up the vagrant instance.

        vagrant up

 2. Change to the Ansible directory:

        cd ansible

 3. Pull the Ansible Galaxy roles:

        ansible-galaxy install -r requirements.yml -p shared-roles --force

 4. Run Ansible:

        ansible-playbook -i inventory/vagrant packer.yml

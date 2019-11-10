package instance

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

const AwsProfile string = "terraform"
const AwsRegion string = "us-east-1"

const ExpectedName string = "test"

func TestInstance(t *testing.T) {
	terraformOptions := &terraform.Options {
		TerraformDir: "../../../../examples/aws/ec2/instance",

		EnvVars: map[string]string{
			"AWS_PROFILE": AwsProfile,
			"AWS_DEFAULT_REGION": AwsRegion,
		},

		Vars: map[string]interface{}{
			"name": ExpectedName,
		},

		NoColor: true,
	}
	  
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	outputs := terraform.OutputAll(t, terraformOptions)
	instanceId := outputs["instance_id"].(string)

	instanceTags := aws.GetTagsForEc2Instance(t, AwsRegion, instanceId)
	name := instanceTags["Name"]
	assert.Equal(t, ExpectedName, name)
}
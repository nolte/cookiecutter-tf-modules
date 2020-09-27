// +build integration

package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformMinimalAccExample(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/minimal",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "helm_release")
	assert.NotNil(t, output)
}

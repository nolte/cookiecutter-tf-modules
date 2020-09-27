// +build integration

package test

import (
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testsBaseDirectory() string {
	return "../"
}

func TestMinimizeComponentsExists(t *testing.T) {

	terraformOptions := &terraform.Options{
		TerraformDir: filepath.Join(testsBaseDirectory(), "examples"),
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "helm_release")
	assert.NotNil(t, output)

}